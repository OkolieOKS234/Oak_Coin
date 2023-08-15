import React, { useState } from "react";
// Classes from Motoko
import {Principal} from "@dfinity/principal";

function Balance() {
  const [inputValue, setInput] = useState("")
  
  async function handleClick() {
    console.log(inputValue);

    // await 
  }


  return (
    <div className="window white">
      <label>Check account token balance:</label>
      <p>
        <input
          id="balance-principal-id"
          type="text"
          placeholder="Enter a Principal ID"
          value={inputValue}
          onChange={(e)=>
            setInput(e.target.value)
          }
        />
      </p>
      <p className="trade-buttons">
        <button
          id="btn-request-balance"
          onClick={handleClick}
        >
          Check Balance
        </button>
      </p>
      <p>This account has a balance of XYZ.</p>
    </div>
  );
}

export default Balance;
