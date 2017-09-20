#include <windows.h>
#include <conio.h>

using namespace std;

int main(int argc, char *argv[]){
  //Check for a keystroke
  if(_kbhit()){
    _getch();  //Eat the char if there's been one
    return 1;
  }
  else{
    Sleep(300);
    return 0;
  }
}
