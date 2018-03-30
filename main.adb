
with Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with  Ada.Numerics.Float_Random;with Ada.Numerics.Discrete_Random;
procedure Main is
  subtype Die is Integer range 0 .. 5;
   subtype Dice is Integer range 2*Die'First .. 2*Die'Last;
   package Random_Die is new Ada.Numerics.Discrete_Random (Die);
   use Random_Die;
   G : Generator;
   D : Dice;
   Deltas : Dice;
   delts: Float;
   Counter: Integer:=0;
   F : File_Type;
   outs: Float:=75.0;
begin
   Create(F, Mode => Out_File, Name => "outs", Form => "");

    Reset (G);  -- Start the generator in a unique state in each run
   loop
      D := Random(G) + Random(G);
      Deltas := Random(G) + Random(G);
      delts:=Float(Deltas);
      if D>5 then outs := outs + (delts/10000.0);
      end if;

      if D<5 then outs := outs - (delts/10000.0);
      end if;

      Ada.Text_IO.Put_Line (F, Float'Image (outs));
      if Counter >4320000 then exit;
         end if;
         Counter:=Counter+1;
   end loop;
Close(F);
end Main;
