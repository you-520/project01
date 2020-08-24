//加载express模块
const express = require("express");

//加载cors模块
const cors = require("cors");

//加载mysql模块
const mysql = require("mysql");

const bodyparser = require("body-parser");

const jwt = require("./jwt");

const { Console } = require("console");

//创建mysql连接池
const pool = mysql.createPool({
  host: '127.0.0.1',
  port: '3306',
  user: 'root',
  password: '',
  database: 'iceCream',
  connectionLimit: 15
});

//创建express应用
const server = express();

//使用cors模块
server.use(cors({
  origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));

// server.use(bodyparser.urlencoded({ extended: false }));

server.use(bodyparser.json())

//用户登录
server.post('/login', (req, res) => {
  var { uname, upwd } = req.body;
  let sql = 'select uid,uname,avatar,phone,birthday,gender from ice_user where uname=?&&upwd=?';
  pool.query(sql, [uname, upwd], (err, result) => {
    console.log(result)
    if (err) throw err;
    if (result.length == 0) {
      res.send({ message: '登录失败', code: 0 });
    } else {
      res.send({ message: '登录成功', code: 1, resilt: result[0], token: jwt.generateToken(result[0]) });
      // res.send({ message: '登录成功', code: 1, resilt: result[0]});
    }
  })

})
//用户注册
server.post('/register', (req, res) => {
  //获取post请求数据
  let obj = req.body;
  // console.log(obj);
  //检测数据是否为空
  if (!obj.uname) {
    //send代表响应结束，不允许再次执行响应
    res.send({ code: 401, msg: 'uname required' });
    //return 阻止往后执行
    return;
  }
  if (!obj.upwd) {
    res.send({ code: 402, msg: 'upwd required' })
    return;
  }
  if (!obj.avatar) {
    res.send({ code: 402, msg: 'avatar required' })
    return;
  }
  if (!obj.phone) {
    res.send({ code: 403, msg: 'phone required' })
    return;
  }
  if (!obj.birthday) {
    res.send({ code: 404, msg: 'birthday required' })
    return;
  }
  if (!obj.gender) {
    res.send({ code: 405, msg: 'gender required' })
    return;
  }
  //将数据插入数据库ice_user表中
  pool.query('INSERT INTO ice_user SET ?', [obj], (err, result) => {
    if (err) throw err;
    // console.log(result);
    //响应成功的对象
    res.send({ code: 200, msg: 'register suc' });
  })
})
//获取收货地址
server.get('/getaddress', (req, res) => {
  let user_id = req.query.user_id;
  let sql = 'SELECT * FROM ice_address WHERE user_id=?';
  // console.log(user_id);
  //通过mysql连接池执行sql语句
  pool.query(sql, [user_id], (err, result) => {
    // console.log(result)
    if (err) throw err;
    res.send({ message: '查询成功', code: 1, result: result });
  });
})
//获取单条收货地址
server.post('/getItemAdd', (req, res) => {
  let aid = req.body.id;
  // console.log(aid)
  let sql = 'SELECT * FROM ice_address WHERE aid=?';
  //通过mysql连接池执行sql语句
  pool.query(sql, [aid], (err, result) => {
    // console.log(result)
    if (err) throw err;
    res.send({ message: '查询成功', code: 1, result: result });
  });
})
//修改收货地址
server.post('/updateAddress', (req, res) => {
  let obj = req.body;
  console.log(obj);
  let aid = obj.aid;
  for (var key in obj) {
    if (!obj[key]) {
      res.send('内容不能为空');
      return;
    }
  }

  var updateInsert = 'update ice_address set ? where aid=?';
  pool.query(updateInsert, [obj, aid], (err, result) => {
    if (err) throw err;
    console.log(result)
    if (result.affectedRows > 0) {
      //   console.log(result.affectedRows)
      res.send('1');
    } else {
      res.send('0');
      //   console.log(result.affectedRows)
    }
  });
})
//创建收货地址
server.post('/addadress', (req, res) => {
  let obj = req.body;
  // console.log(obj);
  // for(var key in obj){
  //     if(!obj[key]){
  //       res.send('内容不能为空');
  //       return;
  //     }
  // }

  var selectInsert = 'insert into ice_address set ?';
  pool.query(selectInsert, [obj], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      //   console.log(result.affectedRows)
      res.send('1');
    } else {
      res.send('0');
      //   console.log(result.affectedRows)
    }
  });
  //MD5用于给数据加密
  // let sql='SELECT id,username FROM xzqa_author WHERE username=? AND password=MD5(?)';
  // pool.query(sql,[uname,upwd],(err,results)=>{
  //     if(err) throw err;
  //     if(results.length==0){
  //         res.send({message:'登录失败',code:0});
  //     }else{
  //         res.send({message:'登录成功',code:1});
  //     }
  // });
})

// 获取所有商品的接口
server.get('/shop', (req, res) => {
  
  var sql = 'SELECT * FROM shop';
  pool.query(sql, [], (err, result) => {
    if (err) throw err;
    res.send({ message: '查询全部商品成功', code: 1, result: result });
  })
})  
// 获取所有商品的接口
server.get('/shop',(req,res)=>{
  var sql='SELECT * FROM shop';
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    console.log(result)
    res.send({message:'查询全部商品成功',code:1,result:result});
  })
})
// // 获取商品详情
server.get('/shopdetail',(req,res)=>{
  var s_id=req.query.sid;
    var sql='SELECT * FROM shopdetail WHERE s_id=?';
    pool.query(sql,[s_id],(err,result)=>{
      if(err) throw err;
      res.send({message:'查询全部商品成功',code:101,result:result});
    })
  })
  // 获得该用户的购物车
  // // 获取商品详情
server.get('/getshopCart',(req,res)=>{
  var uid=req.query.uid;
    var sql='SELECT * FROM shopcart WHERE uid=?';
    pool.query(sql,[uid],(err,result)=>{
      if(err) throw err;
      res.send({message:'查询商品成功',code:101,result:result});
    })
  })
// 加入购物车
server.post('/addShopCart',(req,res)=>{
  let obj=req.body;
  obj.forEach(element => {
    obj=element
    console.log(obj)
    var sql = 'INSERT INTO shopcart SET ?';
    pool.query(sql, [obj], (err, result) => {
      if(err) throw err;
    });
  })
});



//指定web服务器的端口
server.listen(3000,()=>{
    console.log("服务器启动");
});