<template>
    <div>
      <div v-if='!UplodImage'>
            <van-nav-bar
                :title="title"
                left-arrow
                @click-left="onClickLeft"
                @click-right="onClickRight"
                />
      </div>  
      <div v-if='UplodImage'>
      <div style="display:flex;flex-wrap: wrap;justify-content:space-between ;margin:0 20px">
          <div v-for='(item,index) in imageData' :key="index">
             <img :src="item.value" alt="" width="80px" height="80px"  style="margin:10px;border-radius:50%" @click="replace(item)">
          </div>
      </div>
         <button @click="UplodChang" class="sure">确定</button>
      </div>
      <div v-if='!UplodImage'>
        <div class="headertitle" >
            <img src="../../public/image/add.jpg" alt="" v-if="!img" @click='ImageChange'>
            <img :src="img" alt="" v-if="img"> 
        </div>
        <van-form validate-first  @failed="onFailed" @submit="onSubmit">
             <!-- 通过 pattern 进行正则校验 -->
             <van-field
               v-model="value1"
               name="uname"
               label="用户名"
               :rules="[{ pattern, message: '请输入正确内容' }]"
             />
            <!-- 通过 validator 进行函数校验 -->
            <van-field
              v-model="value2"
              name="upwd"
              label="密码"
              :rules="[{ validator, message: '请输入正确内容' }]"
            />
            <!-- 通过 validator 进行异步函数校验 -->
             <van-field
               v-model="value3"
               name="phone"
               label="手机号"
               :rules="[{ validator: asyncValidator, message: '请输入正确内容' }]"
             />
             <!-- 生日 -->
             <van-field v-model="timeValue" 
             placeholder="选择的日期结果" 
             @click="showPopFn()" 
             name="birthday"  
             label="生日" 
             readonly />
             <!-- 弹出层 日期选择框 -->
             <van-popup v-model="show" position="bottom" :style="{ height: '40%' }">
               <van-datetime-picker v-model="currentDate" type="date"  :min-date="minDate"
               :max-date="maxDate" @change="changeFn()" @confirm="confirmFn()" @cancel="cancelFn()" />
             </van-popup>
             <!-- 性别选择器 -->
            <van-field name="gender" label="性别">
              <template #input>
                <van-radio-group v-model="gender" direction="horizontal">
                  <van-radio checked-color="#231815" name="1">男</van-radio>
                  <van-radio checked-color="#231815" name="0">女</van-radio>
                </van-radio-group>
              </template>
            </van-field>
            <div style="margin: 16px;">
             <van-button round block type="info" native-type="submit" color="#e50055">
                 提交
             </van-button>
            </div>
         </van-form>
      </div>
        </div>
</template>
<script>
import { Toast } from 'vant';
export default {
    data() {
        return {
          imageData:[
          {
            key:'1',
            value:require('../assets/mine/1.jpg'),
           }
          ,  {
            key:'2',
            value:require('../assets/mine/2.jpg'),
           }
          ,  {
            key:'3',
            value:require('../assets/mine/3.jpg'),
           },
             {
            key:'4',
            value:require('../assets/mine/4.jpg'),
           },
             {
            key:'5',
            value:require('../assets/mine/5.jpg'),
           },
             {
            key:'6',
            value:require('../assets/mine/6.jpg'),
           }
           ,
             {
            key:'7',
            value:require('../assets/mine/7.jpg'),
           }
           ,
             {
            key:'8',
            value:require('../assets/mine/8.jpg'),
           }
           ,
             {
            key:'9',
            value:require('../assets/mine/9.jpg'),
           }
           ,
             {
            key:'10',
            value:require('../assets/mine/10.jpg'),
           }
           ,
             {
            key:'11',
            value:require('../assets/mine/11.jpg'),
           }
           ,
             {
            key:'12',
            value:require('../assets/mine/12.jpg'),
           }
           ,
             {
            key:'13',
            value:require('../assets/mine/13.jpg'),
           }
           ,
             {
            key:'14',
            value:require('../assets/mine/14.jpg'),
           },
             {
            key:'15',
            value:require('../assets/mine/15.jpg'),
           }
          ],
          UplodImage:false,
            img:'',
            imgs:'',
            title:'注册',
            value1: '',
            value2: '',
            value3: '',
            value4: '',
            gender: '1',
            msg: '',
            currentDate: new Date(),
            changeDate: new Date(),
            show: false, // 用来显示弹出层
            timeValue: ' ',
            minDate: new Date(1990, 0, 1),
            maxDate: new Date(2025, 11, 30),
            //中文验证 用户名
            pattern: /^[\u4E00-\u9FA5A-Za-z0-9_]+$/,
            showCalendar: false,
        };
    },
    methods: {
        UplodChang:function(){

            if(!this.img){
             Toast.fail("请选择头像");
          }
          //console.log(this.img)
           this.UplodImage = false;
        },
        ImageChange:function(){
          this.UplodImage = true;
        },
        replace:function(item){
           var imgs=item.value;
           this.img = imgs;
          //  console.log(imgs);
          //   console.log(this.img)
        },
        onClickLeft() {
            this.$router.push('/mine')
        },
        onClickRight() {
          
        },

         // 校验函数返回 true 表示校验通过，false 表示不通过  密码 数字字母
         validator(val) {
             //字母数字
            var reg=/^[A-Za-z0-9]+$/;
            if(!reg.test(val)){
               return false
            }else{
               return true
            }
         },
         // 异步校验函数返回 Promise  手机号码验证
         asyncValidator(val) {
           return new Promise((resolve) => {
             Toast.loading('验证中...');
             setTimeout(() => {
               var reg=/^((1[0-9][0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
               Toast.clear();
               resolve(reg.test(val));
             }, 300);
           });
         },
        onFailed(errorInfo) {
        console.log('failed', errorInfo);
      },
    // 收集表单数据
      onSubmit(values) {
        // console.log(this.img)
        var arr=(this.img).split('.');
        values.avatar=(arr[0].split('/'))[2]+'.'+arr[2];
      console.log('submit', values);
       this.axios.post('/register',values).then((res)=>{
         console.log(res.data)
         if(res.data.code===200){
            Toast.success('注册成功');
            setTimeout(()=>{
                this.$router.push('/loginin');
            },3000);
            
        }else{
            Toast.fail("注册失败");
        }
        }).catch((error) => {
         console.log(error);
        })
    },
    // 获取生日日期时间
     showPopFn() {
        this.show = true;
      },
      showPopup() {
        this.show = true;
      },
      changeFn() { // 值变化是触发
        this.changeDate = this.currentDate // Tue Sep 08 2020 00:00:00 GMT+0800 (中国标准时间)
      },
      confirmFn() { // 确定按钮
        this.timeValue = this.timeFormat(this.currentDate);
        this.show = false;
      },
      cancelFn(){
        this.show = true;
      },
      timeFormat(time) { // 时间格式化 2019-09-08
        let year = time.getFullYear();
        let month = time.getMonth() + 1;
        let day = time.getDate();
        return year + '-' + month + '-' + day
      }
    },
    mounted() {
      this.timeFormat(new Date());
    }
}
</script>
<style scoped>
 .headertitle{
   text-align: center;
 }
 .headertitle img{ 
    border: 1px solid #755757;
    border-radius: 50%;
    width: 100px;
    height: 100px;
 }
 .sure{
    width: 100%;
    height: 50px;
    font-size: 20px;
    color: #fff;
    background-color: #e50055;
    border: 0;
    border-radius: 20px;
 }

</style>