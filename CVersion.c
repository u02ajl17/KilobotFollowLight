int thevalue; //currentvalue
int theoldvalue; //previously stored thevalue
int substate = 0; //controls substate
int leftorright = 1; // Decides which direction left=1, right=2
int motorMax = 200; //Decides speed of turning motor
int motorMin = 25;//Decides speed of non-turning motor 
int main(){
    if (substate == 0) { //intial state 
            thevalue = sample_light(); //obtain light for this pass
            //set_color(0,3,3); //set colour for monitoring 
            set LED color to RED; 	
            if (thevalue > theoldvalue){
                substate = leftorright;
                theoldvalue = thevalue;
            }
    else if (thevalue < theoldvalue){
                if (leftorright == 1) { //switches the state of leftorright
                    leftorright = 2;}
                else{
                    leftorright = 1;}
                theoldvalue = thevalue;
                substate = leftorright;}
    else if (substate ==1){ //turn left
            set_motor(motorMax,motorMin);  
            substate = 0;
            //set_color(3,0,3) //set colour for observation
            set LED color to BLUE;
    }
    else if (substate ==2) { //turn right
            set_motor(motorMin,motorMax);
            substate = 0;
            set_color(0,0,3) //set colour for observation
    }
