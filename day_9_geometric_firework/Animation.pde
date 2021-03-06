class Animation {
  float t = 0, b = 0, c = 0, d = 0;
  float startT;
  
  boolean moving = false; 
  
  String easing = "";
  
  BezierAnimation exceedOut = new BezierAnimation(0.38, 0.35, 0.2, 1.7);
  
  
  void init(float beginValue, float endValue, float duration, String easingMethod){
    t = 0;
    b = beginValue;
    c = endValue - beginValue;
    d = duration;
    
    startT = millis();
    
    easing = easingMethod;
    
    moving = true;
  }
  
  float update(float currentValue){
    float curVal = 0;
    if(moving){
      t = millis() - startT;
      
      if(t <= d){
        curVal = ease(easing);
      }else{
        curVal = b+c;
        moving = false;
      }
      
      
    }else{
      curVal = currentValue;
    }
    
    return curVal;
  }
  
  float bounce(float tt, float bb, float cc, float dd){
    if ((tt/=dd) < (1/2.75)) {
      return cc*(7.5625*tt*tt) + bb;
    } else if (tt < (2/2.75)) {
      return cc*(7.5625*(tt-=(1.5/2.75))*tt + .75) + bb;
    } else if (tt < (2.5/2.75)) {
      return cc*(7.5625*(tt-=(2.25/2.75))*tt + .9375) + bb;
    } else {
      return cc*(7.5625*(tt-=(2.625/2.75))*tt + .984375) + bb;
    }    
  }
  
  float ease(String theEase){
          // QUAD
        if(theEase == "easeInQuad"){
          return c*(t/=d)*t + b;
        }
        else if(theEase == "easeOutQuad"){
          return -c *(t/=d)*(t-2) + b;
        }
        else if(theEase == "easeInOutQuad"){
          if ((t/=d/2) < 1) return c/2*t*t + b;
          return -c/2 * ((--t)*(t-2) - 1) + b;
        }
        
        // CUBIC
        else if(theEase == "easeInCubic"){
          return c*(t/=d)*t*t + b;
        }
        else if(theEase == "easeOutCubic"){
          return c*((t=t/d-1)*t*t + 1) + b;
        }
        else if(theEase == "easeInOutCubic"){
          if ((t/=d/2) < 1) return c/2*t*t*t + b;
          return c/2*((t-=2)*t*t + 2) + b;
        }
        
        // QUART
        else if(theEase == "easeInQuart"){
          return c*(t/=d)*t*t*t + b;
        }
        else if(theEase == "easeOutQuart"){
          return -c * ((t=t/d-1)*t*t*t - 1) + b;
        }
        else if(theEase == "easeInOutQuart"){
          if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
          return -c/2 * ((t-=2)*t*t*t - 2) + b;
        }
        
        // QUINT
        else if(theEase == "easeInQuint"){
          return c*(t/=d)*t*t*t*t + b;
        }
        else if(theEase == "easeOutQuint"){
          return c*((t=t/d-1)*t*t*t*t + 1) + b;
        }
        else if(theEase == "easeInOutQuint"){
          if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
          return c/2*((t-=2)*t*t*t*t + 2) + b;
        }
        
        // SINE
        else if(theEase == "easeInSine"){
          return -c * cos(t/d * (PI/2)) + c + b;
        }
        else if(theEase == "easeOutSine"){
          return c * sin(t/d * (PI/2)) + b;
        }
        else if(theEase == "easeInOutSine"){
          return -c/2 * (cos(PI*t/d) - 1) + b;
        }  
        
        // SINE
        else if(theEase == "easeInExpo"){
          return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
        }
        else if(theEase == "easeOutExpo"){
          return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
        }
        else if(theEase == "easeInOutExpo"){
          if (t==0) return b;
          if (t==d) return b+c;
          if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
          return c/2 * (-pow(2, -10 * --t) + 2) + b;
        }  
        
        // CIRC
        else if(theEase == "easeInCirc"){
          return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
        }
        else if(theEase == "easeOutCirc"){
          return c * sqrt(1 - (t=t/d-1)*t) + b;
        }
        else if(theEase == "easeInOutCirc"){
          if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
          return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
        }  
        
         // CIRC
        else if(theEase == "easeInCirc"){
          return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
        }
        else if(theEase == "easeOutCirc"){
          return c * sqrt(1 - (t=t/d-1)*t) + b;
        }
        else if(theEase == "easeInOutCirc"){
          if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
          return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
        }  
        
        // ELASTIC
        else if(theEase == "easeInElastic"){
          float s=1.70158;
          float p=0;
          float a=c;
          if (t==0) return b;  if ((t/=d)==1) return b+c;  if (p  != 1) p=d*.3;
          if (a < abs(c)) { a=c; s=p/4; }
          else {s = p/(2*PI) * asin (c/a);}
          return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )) + b;
        }
        else if(theEase == "easeOutElastic"){
          float
          s=1.70158;
          float p=0;
          float a=c;
          if (t==0) return b;  if ((t/=d)==1) return b+c;  if (p != 1) p=d*.3;
          if (a < abs(c)) { a=c; s=p/4; }
          else{ s = p/(2*PI) * asin (c/a);}
          return a*pow(2,-10*t) * sin( (t*d-s)*(2*PI)/p ) + c + b;
        }
        else if(theEase == "easeInOutElastic"){
          float s=1.70158;
          float p=0;
          float a=c;  
          if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (p != 1) p=d*(.3*1.5);
          if (a < abs(c)) { a=c; s=p/4; }
          else{ s = p/(2*PI) * asin (c/a);}
          if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )) + b;
          return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )*.5 + c + b;
        } 
        
        // BACK
        else if(theEase == "easeInBack"){
          float s = 1.70158;
          return c*(t/=d)*t*((s+1)*t - s) + b;
        }
        else if(theEase == "easeOutBack"){
          float s = 1.70158;
          return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
        }
        else if(theEase == "easeInOutBack"){
          float s = 1.70158; 
          if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
          return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
        }  
        
        // BOUNCE
        else if(theEase == "easeInBounce"){
          return c - bounce(d-t, 0, c, d) + b;
        }
        else if(theEase == "easeOutBounce"){
          return bounce(t,b,c,d);
        }
        else if(theEase == "easeInOutBounce"){
          if (t < d/2) return bounce (t*2, 0, c, d) * .5 + b;
          return bounce (t*2-d, 0, c, d) * .5 + c*.5 + b;
        }  
        
        // EXCEED
        else if(theEase == "easeOutExceed"){
          return c * exceedOut.get(t/d) + b;
        }
        return 0;
  }  
}

// Adapted from http://greweb.me/2012/02/bezier-curve-based-easing-functions-from-concept-to-implementation/
class BezierAnimation{
 float mX1, mY1, mX2, mY2;
 BezierAnimation(float _mX1, float _mY1, float _mX2, float _mY2){
   mX1 = _mX1;
   mY1 = _mY1;
   mX2 = _mX2;
   mY2 = _mY2;
 }
 float get (float aX) {
    if (mX1 == mY1 && mX2 == mY2) return aX; // linear
    return CalcBezier(GetTForX(aX), mY1, mY2);
  }

  float A(float aA1, float aA2) { 
    return 1.0 - 3.0 * aA2 + 3.0 * aA1; 
  }
  
  float B(float aA1, float aA2) { 
    return 3.0 * aA2 - 6.0 * aA1; 
  }
  float C(float aA1){ 
    return 3.0 * aA1; 
  }

  // Returns x(t) given t, x1, and x2, or y(t) given t, y1, and y2.
  float CalcBezier(float aT, float aA1, float aA2) {
    return ((A(aA1, aA2)*aT + B(aA1, aA2))*aT + C(aA1))*aT;
  }

  // Returns dx/dt given t, x1, and x2, or dy/dt given t, y1, and y2.
  float GetSlope(float aT, float aA1, float aA2) {
    return 3.0 * A(aA1, aA2)*aT*aT + 2.0 * B(aA1, aA2) * aT + C(aA1);
  }

  float GetTForX(float aX) {
    // Newton raphson iteration
    float aGuessT = aX;
    for (int i = 0; i < 4; i++) {
      float currentSlope = GetSlope(aGuessT, mX1, mX2);
      if (currentSlope == 0.0) return aGuessT;
      float currentX = CalcBezier(aGuessT, mX1, mX2) - aX;
      aGuessT -= currentX / currentSlope;
    }
    return aGuessT;
  } 
}