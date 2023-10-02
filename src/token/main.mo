import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Text "mo:base/Text";



actor Token {
var owner : Principal = Principal.fromText("7l3lw-ebom3-y6aj4-huvzw-stlvw-h3dq2-m7mpl-rwfju-6j6a2-uqp2i-xae");
var  totalSupply : Nat = 1000000000;
var symbol : Text = "OAK";

// var balances = HashMap.HashMap<Key, Value>(size of our hashmap, keyEquality, keyHash)
var balances = HashMap.HashMap<Principal,Nat>(1, Principal.equal, Principal.hash);

balances.put(owner, totalSupply);


// Check balance

// First we are passing the balance of the principal
public query func balanceOf(who:Principal): async Nat{
    // checking how much they own, then checking if it is null set to zero, but if it is optional display
let balance : Nat  = switch (balances.get(who)){
    case null 0;
    case (?result) result;
};


return balance
};

public query func getSymbol(): async Text{
return symbol;
};



public shared(msg) func payOut(): async Text{
// Debug.print(debug_show(msg.caller));
if(balances.get(msg.caller)== null){
let amount = 10000;
balances.put(msg.caller, amount);
return "Success";
}else{
    return "Already Claimed";
}

}

}