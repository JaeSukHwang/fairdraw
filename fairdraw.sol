pragma solidity ^0.4.24;

contract Fairdraw {
    struct Game {
        address user;
    }    
    struct draw { //뽑기 구조체의 뽑기이름이란, 노말인지 프리미엄박스인지. 뽑기의 이름과 그에 따른 캐릭터리스트가 나온다.
        string drawname;
        string[] characterlist;
    }
    
    draw[] public drawlist; //뽑기 박스는 현재 우리는 두개밖에 없지만, 게임회사가 임의로 추가할 수 있기 때문에 배열 처리한다.
    mapping(string => draw) getdraw; //drawlist의 이름으로 drawlist를 가리키기 위한, 포인터.
    mapping (string => string) charToRank;
    mapping (string => uint) rankToProb;
    
    uint[] characterID;
    
    mapping (uint => account) characterOwner;
    boolean canChangeProb = 0;
    
    mapping (address => uint[]) characterCollection;
    
    struct monster{
        string name;
        string rank;
    }
    function addDraw(string _drawname, string[] _characterlist) public { //drawlist에 draw 종류를 추가하는 함수
        getdraw[_drawname] = new draw(_drawname,_characterlist); //지금 getdraw[_normal] 에는 draw 구조체가 들어가있다.
        drawlist.push(getdraw[_drawname]);
    } 
    
    uint n_rand = keccak256("normalBox");
    uint p_rand = keccak256("premiumBox");
    
    addDraw("normalBox",normal_characterlist[]);//-> getdraw[normalbox]에 객첼체를 넣어준 다음, drawlist에 getdraw[normalbox] 로 사용한다. 즉 캐릭터리스트에 접근할때, drawlist에 푸쉬된 getdraw를 사용.
    addDraw("premiumBox",premium_characterlist[]);
    
    
    
    
    
    
    function setCharToRank(string _charactername,string _rank) {
        charToRank(_str,_rank);
    }
    function setCharToRank(string _drawname, string _charctername) public {
          = getdraw[_drawname].characterlist;
    }
    
    function setCharOfBox(string _drawname, string[] character, draw[], drawlist){
        //value of charToRank = s, a, b -> premium
        //value of charToRank = a, b, c -> normal
        if (keccak256(drawlist[_drawname].name) == keccak256('premium')) {
            
            
        } else if (keccak256(drawlist[_drawname].name) == keccak256('normal')) {
            
            
        }
    }
    
    function setRankToProb(uint, rank){
        if valueOfCOB == premium {
            if valueofCTR == S : prob == 0.1;
            else if == A : prob == 0.3;
        }
        else if 
        
        
    }
    
    
    function draww (draw , account , user){
        //Character = 뽑기;
        ID = characterID[-1]
        push ID //
        characterOwner[ID] = user;
        characterCollection[user].push(ID);
}

