.assembly Alpha {}
.module Alpha.exe

.class public Alpha
{
    .method public static void Main() cil managed
    {
        .entrypoint
        .maxstack 2
        .locals init ([0] int32 counter, [1] string endMessage)
        ldc.i4.s 5
        stloc.0
        ldstr "The loop has ended."
        stloc.1
        
        loopStart:
            ldloc.0
            ldc.i4.0
            ble loopEnd
            
            ldloc.0
            call void [System.Console]System.Console::WriteLine(int32)
            
            ldloc.0
            ldc.i4.1
            sub
            stloc.0
            
            br loopStart
            
        loopEnd:
            ldloc.1
            call void [System.Console]System.Console::WriteLine(string)
            ret

    }
}