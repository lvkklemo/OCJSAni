/**
 * Created by lvkk on 17/6/9.
 */

 function DMan(option){
    this._init(option);
}

DMan.prototype={
    //初始化
    _init:function(option){

        this.originW=option.orginW||40;
        this.originH=option.orginH||65;

        this.w=option.w||40;
        this.h=option.h||65;

        this.x=option.x||0;
        this.y=option.y||0;

        this.dirIndex=0;
        this.fps=option.fps||10;
        this.imgUrl=option.imgUrl||'';

    },
    //渲染当前页面
    render:function(ctx){
        var img=new Image();
        img.src=this.imgUrl;
        var self=this;
        img.onload=function(){
            var X=0;
            ;
            setInterval(function(){

                ctx.clearRect(0,0,ctx.canvas.width,ctx.canvas.height);
                ctx.drawImage(
                    img //绘制的原始图片
                    , X * self.originW  // 剪切图片的x坐标
                    , self.dirIndex * self.originH// 剪切图片的y坐标
                    , self.originW
                    , self.originH
                    , self.x
                    , self.y
                    , self.w
                    , self.h
                ),
                    X++;
                X=X%4
            },1000/self.fps);
        }

    },
    //改变方向
    changeDirection:function(dir){
        if(dir=='left'){
          this.dirIndex=1;
        };
        if(dir=='right'){
            this.dirIndex=2;
        };
        if(dir=='up'){
            this.dirIndex=3;
        };
        if(dir=='down'){
            this.dirIndex=0;
        }

    }
}