unit TimeMeasuring;

interface

uses
  SysUtils;

  procedure StartTimeMeasuring;
  procedure StopTimeMeasuring;

var
  TStt, TEnd, TPer, TInt: Int64;
  TSec: Extended;

implementation

procedure StartTimeMeasuring;
begin
  asm
    RDTSC
    MOV DWORD PTR [TStt], EAX
    MOV DWORD PTR [TStt + 4], EDX
  end;
end;

procedure StopTimeMeasuring;
begin
  asm
    RDTSC
    MOV DWORD PTR [TEnd], EAX
    MOV DWORD PTR [TEnd + 4], EDX
  end;
  TInt := TEnd - TStt;
  TSec := TInt / TPer;
end;

begin
  asm
    RDTSC
    MOV DWORD PTR [TStt], EAX
    MOV DWORD PTR [TStt + 4], EDX
  end;
  Sleep(1000);
  asm
    RDTSC
    MOV DWORD PTR [TEnd], EAX
    MOV DWORD PTR [TEnd + 4], EDX
  end;
  TPer := TEnd - TStt;
end.

