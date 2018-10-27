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
    mapping (string => uint) rankToProb; // ?
    mapping (uint => address) characterOwner;
    mapping (address => uint[]) characterCollection;    
    
    uint[] characterId;

    bool canChangeProb = false;
    
    struct character{
        string charactername;
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
    // } ---> 이렇게 캐릭터값 입력받는 과정이 밑의 함수에서 for문이 해주는 것.
    
    function _enhance(character){
        
    }
    
    
    function _draw(string _drawname) internal returns (string, uint) {
        string result; 
        uint index; 
        string[] rank_member; 
        uint rand = random(); //rand를 난수로 받고, 이 난수를 확률밀도함수처럼 범위 설정해주는 게 핵심. 0.3 이렇게 하드코딩하는 것이 아님. 
        if (keccak256(getdraw[_drawname].drawname) == keccak256('premium')) { //프리미엄 박스면. 
            if (rand <= 10) { 
                for (uint i = 0; i < getdraw[_drawname].characterlist.length; i++) { //프리미엄 박스에 있는 캐릭터 갯수만큼 반복문.
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[i]]) == keccak256("S")) { //해당 캐릭터 맵핑값이 S면,
                        rank_member.push(getdraw[_drawname].characterlist[i]); //랭크멤버 리스트에 해당 캐릭터를 넣어주고.
                    }
                }
                index = index_random(rank_member); //인덱스는 랭크멤버에 해당하는 인덱스랜덤함수 값을 넣어주고. //인덱스 램덤함수는 수많은 동일 랭크 멤버가 뽑힐 확률을 균등하게 하는 역할.
                result = rank_member[index]; //결과는 해당 랭크 멤버이다. 
                return (result, rand); // 그 멤버가 뽑힌 확률값을 보여줌.
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
            if (rand <= 20) { 
                for (uint x = 0; x < getdraw[_drawname].characterlist.length; x++) { //프리미엄 박스에 있는 캐릭터 갯수만큼 반복문.
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[x]]) == keccak256("A")) { //해당 캐릭터 맵핑값이 S면,
                        rank_member.push(getdraw[_drawname].characterlist[x]); //랭크멤버 리스트에 해당 캐릭터를 넣어주고.
                    }
                }
                index = index_random(rank_member); //인덱스는 랭크멤버에 해당하는 인덱스랜덤함수 값을 넣어주고. //인덱스 램덤함수는 수많은 동일 랭크 멤버가 뽑힐 확률을 균등하게 하는 역할.
                result = rank_member[index]; //결과는 해당 랭크 멤버이다. 
                return (result, rand); // 그 멤버가 뽑힌 확률값을 보여줌.
            } else if ((rand > 20) && (rand <= 50)) {
                for (uint y = 0; y<getdraw[_drawname].characterlist.length; y++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[y]]) == keccak256("B")) {
                        rank_member.push(getdraw[_drawname].characterlist[y]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
                return (result,rand);
            } else {
                for (uint z = 0; z<getdraw[_drawname].characterlist.length; z++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[z]]) == keccak256("C")) {
                        rank_member.push(getdraw[_drawname].characterlist[z]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
                return (result, rand);
            }
            
            
        }
    }
    
    function draw(string _drawname) public returns (string, uint){
        return _draw(_drawname);
    }
    
    function random() view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp)) % 100) + 1; // 1 ~ 100 (Only for testing.)
    }
    
    function index_random(string[] list) view returns (uint16) { //동일 랭크  캐릭터가 동일하게 뽑히게 하는 역할.
        return uint16(uint256(keccak256(block.timestamp)) % list.length);
    }
}
