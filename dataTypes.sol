pragma solidity 0.7.0;
 
contract dataTypes {
    // State Variable
    //int - interger - neg + pos 
    //uint - unsigned int - only pos
    //int = int256
    
    /* int public integer = 0 - 1;
    //uint public uInteger = uint(0-1);
    uint tem =10;
    uint eleven = 11;
    
    function test () public view returns(uint) {
        return ten - eleven;
    }*/
    
    function add(uint a,uint b) public view returns(uint) {
    return a+b;  }
    function sub(uint a,uint b) public view returns(uint) {
    return a-b;  }
    function div(uint a,uint b) public view returns(uint) {
    return a/b; } 
    function mul(uint a,uint b) public view returns(uint) {
    return a*b;}  
    function mod(uint a,uint b) public view returns(uint) {
    return a%b;  
    }
}