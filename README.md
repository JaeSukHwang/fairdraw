# Fair Draw ( Klaytn을 활용한 게임 내 확률공개 플랫폼 ) v 1.0


## 1. What?
Fair Draw는 게임 내에서 이뤄지는 각종 확률 요소(뽑기, 확률)를 블록체인에 올려 확률 조작을 방지하기 위한 플랫폼입니다.

## 2. Why BlockChain?
블록체인을 통해 smart contract의 변경 내역은 모두 영구적으로 기록이 되므로 잠수함패치를 통한 확률 조작으로부터 자유롭습니다.
Fair Draw API를 사용함으로써 게임 회사는 블록체인을 위한 개발 투자를 따로 하지 않아도 됩니다.
게임 이용자는 확률 변경 내역이 smart contract를 통해 투명하게 공개됩니다.
공급자와 수요자의 win-win을 도모할 수 있다는 것이 Fairdraw의 selling point입니다.

## 3. Source Code Specification

### [0] Data Structure & Mapping


| struct | attr | 설명 |
| ---- | ---- | -------- |
| Draw | drawname,characterlist[] | 뽑기 상자 별로 나오는 캐릭터 리스트가 다르므로, 커스터마이징 가능. |
| Character | charactername,rank,level,Id | 게임 회사가 필요에 따라 커스마이징 가능. ex)stat |


struct Draw { //뽑기 구조체의 뽑기이름이란, 노말인지 프리미엄박스인지. 뽑기의 이름과 그에 따른 캐릭터리스트가 나온다.
        string drawname;
        string[] characterlist;
    }
    
    struct Character{
        string charactername;
        string rank;
        uint level;
        uint Id;
    }
    
    mapping (string => Draw) getdraw; //drawlist의 이름으로 drawlist를 가리키기 위한, 포인터. getdraw[_drawname].drawname
    mapping (string => string) charToRank; //charToRank[_charactername] = 'S' //'Ronaldo' = 'S'
    mapping (uint => string) characterOwner; //생성된 캐릭터의 주인이 누구인지 알려주기 위함. (0번째 캐릭터의 주인이 누구)
    //일단 유저이름으로 input data 받지만, 추후 address로 변경 가능함 //characterOwner[0] = 'userID'
    mapping (string => Character[]) characterCollection; //유저의 캐릭터 보유 내역을 보여주는 맵핑
    mapping (uint => Character) charById; //캐릭터에 부여된 Id로 캐릭터를 식별하기 위함. //강화를 위해 필요.

    function setCharToRank(string _charactername, string _rank) {
        charToRank[_charactername] = _rank;
    }
    bool canChangeProb = false;
    Character[] public character_data;//게임 내에 존재하는 모든 캐릭터의 목록의 배열.
    
    
   
   
### [1] draw


draw는 뽑기를 구현하기 위한 함수입니다.


```
function _draw(string _drawname) internal {
        string result; 
        uint index; 
        string[] rank_member; 
        uint rand = random(); //random()을 통해 1~100 중 하나의 수를 받습니다.  
        if (keccak256(getdraw[_drawname].drawname) == keccak256('premium')) { //뽑기상자가 '프리미엄' 박스일 때,
            if (rand <= 10) {
                for (uint i = 0; i < getdraw[_drawname].characterlist.length; i++) { //프리미엄 박스에 있는 캐릭터 갯수만큼 반복문.
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[i]]) == keccak256("S")) { //해당 캐릭터 랭크가 S면,
                        rank_member.push(getdraw[_drawname].characterlist[i]); //랭크멤버 리스트에 해당 캐릭터를 넣어준다.
                    }
                }
                index = index_random(rank_member); //인덱스는 랭크멤버에 해당하는 인덱스랜덤함수 값을 넣어주고. 
                //인덱스 램덤함수는 수 많은 동일 랭크 멤버가 뽑힐 확률을 균등하게 하는 역할.
                result = rank_member[index]; //결과는 해당 랭크 멤버이다. 
            } else if ((rand > 10) && (rand <= 40)) {
                for (uint j = 0; j < getdraw[_drawname].characterlist.length; j++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[j]]) == keccak256("A")) {
                        rank_member.push(getdraw[_drawname].characterlist[j]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
            } else {
                for (uint k = 0; k<getdraw[_drawname].characterlist.length; k++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[k]]) == keccak256("B")) {
                        rank_member.push(getdraw[_drawname].characterlist[k]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
            }
        } else if (keccak256(getdraw[_drawname].drawname) == keccak256('normal')) { //뽑기상자가 '노말' 박스일 때,
            if (rand <= 20) { 
                for (uint x = 0; x < getdraw[_drawname].characterlist.length; x++) { 
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[x]]) == keccak256("A")) { 
                        rank_member.push(getdraw[_drawname].characterlist[x]); 
                    }
                }
                index = index_random(rank_member); 
                result = rank_member[index]; 
            } else if ((rand > 20) && (rand <= 50)) {
                for (uint y = 0; y<getdraw[_drawname].characterlist.length; y++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[y]]) == keccak256("B")) {
                        rank_member.push(getdraw[_drawname].characterlist[y]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
            } else {
                for (uint z = 0; z<getdraw[_drawname].characterlist.length; z++) {
                    if (keccak256(charToRank[getdraw[_drawname].characterlist[z]]) == keccak256("C")) {
                        rank_member.push(getdraw[_drawname].characterlist[z]);
                    }
                }
                index = index_random(rank_member);
                result = rank_member[index];
            }
        }
        character_data.push(Character(result, charToRank[result], 1, character_data.length));
        charById[character_data.length-1] = character_data[character_data.length-1];
        //emit Finished_draw(result, rand) 그 멤버가 뽑힌 확률값을 보여줌.
    }
    
    function draw(string _drawname, string _user) public {
        _draw(_drawname);
        // characterCollection[_user].push(character_data[character_data.length]);
    }
    
    function random() view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp)) % 100) + 1; // 1 ~ 100 (Only for testing.)
    }
    
    function index_random(string[] list) view returns (uint16) { //동일 랭크  캐릭터가 동일하게 뽑히게 하는 역할.
        return uint16(uint256(keccak256(block.timestamp)) % list.length);
    }

```

### [2] enhance


enhance를 캐릭터의 등급(레벨)을 강화 구현을 위한 함수입니다.


```
    event SuccessMessage(bool result, uint level, uint rand);
    
    function enhance(uint _charId) public { 
        require(charById[_charId].level < 6); //캐릭터 아이디로 캐릭터를 식별함. 6레벨까지 있으므로 require문 사용.
        uint rand = random();
        if (rand < 70) {
            charById[_charId].level = charById[_charId].level + 1;
            emit SuccessMessage(true, charById[_charId].level, rand);
        } else {
            charById[_charId].level = 1;
            emit SuccessMessage(false, charById[_charId].level,rand);
        }
        character_data[_charId].level = charById[_charId].level;
        //assert 문 필요합니다
    }
```

### [3] Etc


게임 회사의 커스터마이징 용 함수 입니다.

```

function addDraw(string _drawname, string[] _characterlist) public { //drawlist에 draw 종류를 추가하는 함수
        //추후 require로 중복 방지
        getdraw[_drawname] = Draw(_drawname,_characterlist); //지금 getdraw[_normal] 에는 draw 구조체가 들어가있다.
    }
```
    
    
