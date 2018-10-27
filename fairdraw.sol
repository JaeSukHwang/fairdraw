pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract Fairdraw {
    struct Game {
        address user;
    }    
    struct Draw { //뽑기 구조체의 뽑기이름이란, 노말인지 프리미엄박스인지. 뽑기의 이름과 그에 따른 캐릭터리스트가 나온다.
        string drawname;
        string[] characterlist;
    }
    
    Draw[] public drawlist; //뽑기 박스는 현재 우리는 두개밖에 없지만, 게임회사가 임의로 추가할 수 있기 때문에 배열 처리한다.
    mapping(string => Draw) getdraw; //drawlist의 이름으로 drawlist를 가리키기 위한, 포인터.
    mapping (string => string) charToRank;
    mapping (string => uint) rankToProb;
    
    uint[] characterID;
    
    mapping (uint => address) characterOwner;
    bool canChangeProb = false;
    
    mapping (address => uint[]) characterCollection;
    
    struct monster{
        string name;
        string rank;
    }
    
    function addDraw(string _drawname, string[] _characterlist) public { //drawlist에 draw 종류를 추가하는 함수
        getdraw[_drawname] = Draw(_drawname,_characterlist); //지금 getdraw[_normal] 에는 draw 구조체가 들어가있다.
        drawlist.push(getdraw[_drawname]);
    }
    
    
    function setCharToRank(string _charactername, string _rank) {
        charToRank[_charactername] = _rank;
    }
    
    // function setCharToRank(string _drawname, string _charctername) public {
    //       = getdraw[_drawname].characterlist;
    // }
    
    // function setCharOfBox(string _drawname, string[] character){
    //     string[] storage characterlist = drawlist[_drawname].characterlist;
    //     //value of charToRank = s, a, b -> premium
    //     //value of charToRank = a, b, c -> normal
    //     if (keccak256(drawlist[_drawname].name) == keccak256('premium')) {
    //         for (i=0; i < ; i++){
    //             characterlist[0]
    //         }
    //         drawlist[_drawname].characterlist[]
    //     } else if (keccak256(drawlist[_drawname].name) == keccak256('normal')) {
            
            
    //     }
    // }
    
    // function setRankToProb() public {
    //     if (keccak256(drawlist[_drawname].name) == keccak256('premium')) {
    //         for
    //     }
    //     if valueOfCOB == premium {
    //         if valueofCTR == S : prob == 0.1;
    //         else if == A : prob == 0.3;
    //     }
    //     else if 
    // }
    
    function _draw(string _drawname) internal returns (string, uint) {
        string result;
        uint index;
        string[] rank_member;
        uint rand = random();
        if (keccak256(getdraw[_drawname].drawname) == keccak256('premium')) {
            if (rand <= 10) {
                for (uint i = 0; i < getdraw[_drawname].characterlist.length; i++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[i]]) == keccak256("S")) {
                        rank_member.push(getdraw[_drawname].characterlist[i]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
                return (result, rand);
            } else if ((rand > 10) && (rand <= 40)) {
                for (uint j = 0; j<getdraw[_drawname].characterlist.length; j++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[j]]) == keccak256("A")) {
                        rank_member.push(getdraw[_drawname].characterlist[j]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
                return (result,rand);
            } else {
                for (uint k = 0; k<getdraw[_drawname].characterlist.length; k++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[k]]) == keccak256("B")) {
                        rank_member.push(getdraw[_drawname].characterlist[k]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
                return (result, rand);
            }
        } else if (keccak256(getdraw[_drawname].drawname) == keccak256('normal')) {
            
        }
    }
    
    function draw(string _drawname) public returns (string, uint){
        return _draw(_drawname);
    }
    
    function random() view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp)) % 100) + 1; // 1 ~ 100 (Only for testing.)
    }
    
    function index_random(string[] list) view returns (uint16) {
        return uint16(uint256(keccak256(block.timestamp)) % list.length);
    }
}
