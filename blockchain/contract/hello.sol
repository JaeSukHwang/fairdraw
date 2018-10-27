pragma solidity ^0.4.25;

contract Hello {
    string hello = "hello";
    function say_hello() public returns (string){
        return hello;
    }

    functino say_userhello(_name) public returns (string) {
        string result = _name + hello
    }
}
s
