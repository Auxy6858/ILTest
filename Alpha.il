.assembly Alpha {}
.module Alpha.exe

.class public Alpha
{
    .method public static void Main() cil managed
    {
        .entrypoint
        // Here we declare that our stack will only have a maximum of 2 items on it at any given moment
        .maxstack 2
        // This creates 2 variables, which are indexed at 1 and 0
        .locals init ([0] int32 counter, [1] string endMessage)
        /*
         * LDC loads a constant, which we specify is a 4 byte (32 bit) intager with .i4, 
         * we use .s to specify that we are working with a short (8 bit) intager
         */
        ldc.i4.s 5
        // stloc.0 stores the value on the top of the stack in the variable indexed at 0, in our case
        // this variable is the 32 bit intager called counter we declared on line 12
        stloc.0
        // we load the string onto the stack then we store it in our endMessage variable
        ldstr "The loop has ended."
        stloc.1
        
        // loopStart specifies a segment of our code, in this case we are creating a while loop
        // so we load the counter variable onto the stack, along with the constant 0
        // if the value of counter is less than or equal to 0, we branch to the section of code
        // labeled loopEnd. Otherwise we continue.
        loopStart:
            ldloc.0
            ldc.i4.0
            ble loopEnd
            
            // we load the counter variable onto the top of the stack
            ldloc.0
            // when we call a method it takes the value that is at the top of the stack as an argument
            call void [System.Console]System.Console::WriteLine(int32)
            
            // we load the counter variable onto the stack first, then we load the number 1 onto the stack
            // the sub opcode then subtracts the last value loaded on the stack from the first one
            // this new value is then stored back into the variable counter, giving us:
            // counter = counter - 1
            ldloc.0
            ldc.i4.1
            sub
            stloc.0
            
            // we then go back to the beginning of loopStart
            br loopStart
            
        loopEnd:
            // This code is executed when the ble instruction is sucessful, indicating the loop has ended
            // The variable endMessage is loaded onto the stack then passed as an argument into the method
            // WriteLine
            ldloc.1
            call void [System.Console]System.Console::WriteLine(string)
            // the ret keyword returns us from the Main method, indicating the method is finished
            ret

    }
}