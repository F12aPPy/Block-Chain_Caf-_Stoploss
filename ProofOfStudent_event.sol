pragma solidity ^0.5.1;

contract ProofOfStudent {
    
    struct Ordersdata{
        string name;
        uint timestamp;
        address addr;
    }
    
  //mapping (bytes32 => bool) private listOrder;
  mapping (uint => Ordersdata) private listOrder;
  mapping (uint => string) private listCustommer;
  mapping (uint => uint) private listTimestamp;
  mapping (uint => address) private listAddress;

  //---events---
  event OrderAdded(
    address from,   
    string text,
    uint datetime,
    bytes32 hash
  );
  
  event OrderError(
    address from,
    string text,
    string reason
  );

  uint ordercount = 0;

  // store the proof for a student in the contract state

  function recordNameOrder(string memory name) private {
    listCustommer[ordercount] = name;
  }

  function recordTimestampOrder(uint date) private {
    listTimestamp[ordercount] = date;
  }

  function recordAddressOrder(address addr) private{
    listAddress[ordercount] = addr;
  }
  
  function recordOrder(Ordersdata memory data_order) private{
      listOrder[ordercount] = data_order;
  }
  
  // record a student name
  function GetOrder(string memory name) public payable {
      
    //espresso soda
    if (msg.value != 0.0021 ether && hashing(name) == hashing("Espresso Soda")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0021 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }
    
    //americano yuzu
    if (msg.value != 0.0025 ether && hashing(name) == hashing("Americano Yuzu")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0025 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }
    
    //royal milk tea
    if (msg.value != 0.0018 ether && hashing(name) == hashing("Royal Milk Tea")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0018 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }
    
    //Stir Fried Basil with Kaffir Lime Leaf
    if (msg.value != 0.0045 ether && hashing(name) == hashing("Stir Fried Basil with Kaffir Lime Leaf")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0045 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }
    
     //Grilled Pork Neck
    if (msg.value != 0.0055 ether && hashing(name) == hashing("Grilled Pork Neck")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0055 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }
    
     //Pan Fried Egg
    if (msg.value != 0.0035 ether && hashing(name) == hashing("Pan Fried Egg")) {
        
        emit OrderError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0035 ether for registration");
        
        
        msg.sender.transfer(msg.value);
        
        return;
    }

   
    Ordersdata memory orderdata = Ordersdata(name, block.timestamp, msg.sender);
    recordOrder(orderdata);
    recordNameOrder(name);
    recordTimestampOrder(now);
    recordAddressOrder(msg.sender);
    ordercount++;

    
    //---fire the event---
   emit OrderAdded(msg.sender, name, now,
        hashingOrder(name, now, msg.sender));
    }
  
  // SHA256 for Integrity
  
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }

  function hashingOrder(string memory name, uint timestamp, address addr) private
  pure returns (bytes32) {
    return sha256(abi.encodePacked(name,timestamp,addr));
  }
  
  // get name
  function getName(uint index) public view returns (string memory) {
    return listCustommer[index];
  }

  // get timestamp
  function getTimestamp(uint index) public view returns (uint) {
    return listTimestamp[index];
  }
  
  // get address
  function getAddress(uint index) public view returns (address) {
    return listAddress[index];
  }
  
  //get countorder
  function getOrderCount() public view returns (uint){
    return ordercount;
  }
}