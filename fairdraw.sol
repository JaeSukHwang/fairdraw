pragma solidity ^0.4.24;

contract Fairdraw {
    construct Game {
        account user;
        
        struct draw {
            string name;
            string[] character;
            uint rank;
        }
        
    }
    
    mapping (str => uint) charToRank;
    mapping (str => draw[]) charToDraw;
    mapping (uint => uint) rankToProb;
    
    uint[] characterID;
    
    mapping (uint => account) characterOwner;
    boolean canChangeProb = 0;
    
    mapping (account address => uint[]) characterCollection;
    
    struct monster {
        string name;
        uint rank;
    }
    
    function setRankOfChar(string _str, string[] character, uint , uint rank) {
        charToRank[character] = rank;
    }
    
    function setCharToDraw(string _str, string[] character, draw[], drawlist){
        charToRank[character] = drawlist;
    }
    function setRankToProb(uint, rank){
        //1~6랭크
    }
    function draww (draw , account , user){
        //Character = 뽑기;
        ID = characterID[-1]
        push ID //
        characterOwner[ID] = user;
        characterCollection[user].push(ID);
}

