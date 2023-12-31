GDPC                p                                                                         P   res://.godot/exported/133200997/export-a4951207776b25ee5c8b2b05c1463587-menu.scn�%      �      @����;��8���    T   res://.godot/exported/133200997/export-a83cf8f48b1cf9ea574e7f03773d7d43-board.scn         4      �L�غ��p�    ,   res://.godot/global_script_class_cache.cfg  �,             ��Р�8���8~$}P�    H   res://.godot/imported/Board.png-faa5ca4bef2da175771be7e73eb7e6b1.ctex   �      �       ��?+K!r?$���O    D   res://.godot/imported/O.png-f6bad6564a28e2574cab2711aedab841.ctex   P            �:H��܉ �4�O�� �    D   res://.godot/imported/X.png-a5bb159aaaacfed43e26aadbaba5f34a.ctex   0
            �uǾ:�
��b�+�Hr    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexP      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �0      �       ��&��_L%��,�y       res://Scripts/Board.gd          �      (�b�,���.���2��       res://Scripts/Client.cs �             h�)ژ��@��ح\��@       res://Scripts/Menu.gd   �      �       �_c5��S��m��
        res://Textures/Board.png.import �      �       2�)�b�X@�h���       res://Textures/O.png.import p	      �       ~(���n��eX����       res://Textures/X.png.import P      �       ��rax�FS�(��;�       res://board.tscn.remap  �+      b       ����`�z�D:�g�       res://icon.svg  �,      �      C��=U���^Qu��U3       res://icon.svg.import   0%      �       `|���t?��|8(bL       res://menu.tscn.remap   0,      a       Z'�R�i8�9�Y3       res://project.binary@1      n      ���F��Ս8��U9{            extends Node2D

var board ={1:"",2:"",3:"",4:"",5:"",6:"",7:"",8:"",9:""}

@export var X : Texture2D
@export var O : Texture2D

#@export var isMyTurn : bool
#@export var isX : bool

func _ready() -> void:
	pass

func try_make_move(pos:int):
	if ClientSide.isMyTurn:
		if board[pos]=="":
			if ClientSide.isX:
				make_move(pos,"X")
			else:
				make_move(pos,"O")
	

func make_move(pos:int,turn: String):
	var area=get_child(pos)
	if turn=="X":
		board[pos]="X"
		print(board)
		area.get_node("Sprite").texture=X
	else:
		board[pos]="O"
		print(board)
		area.get_node("Sprite").texture=O


func event_handler(event:InputEvent,pos:int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			try_make_move(pos)

func _on_area_1_input_event(viewport, event, shape_idx):
	event_handler(event,1)


func _on_area_2_input_event(viewport, event, shape_idx):
	event_handler(event,2)


func _on_area_3_input_event(viewport, event, shape_idx):
	event_handler(event,3)


func _on_area_4_input_event(viewport, event, shape_idx):
	event_handler(event,4)


func _on_area_5_input_event(viewport, event, shape_idx):
	event_handler(event,5)


func _on_area_6_input_event(viewport, event, shape_idx):
	event_handler(event,6)


func _on_area_7_input_event(viewport, event, shape_idx):
	event_handler(event,7)


func _on_area_8_input_event(viewport, event, shape_idx):
	event_handler(event,8)


func _on_area_9_input_event(viewport, event, shape_idx):
	event_handler(event,9)

               extends Node2D

func _on_start_button_pressed():
	ClientSide.ConnectToServer("127.0.0.1",4000, $Panel/Username.text)
	
func loadGame():
	get_tree().change_scene_to_file("res://board.tscn")
   GST2            ����                        �   RIFF�   WEBPVP8Lv   /��� 0��?��x`�6��^$e��&�/�oG�R<�w�ܴ����������������D�����<Rw��һ����������������������I��92������������              [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dbjvb4sbyp7sj"
path="res://.godot/imported/Board.png-faa5ca4bef2da175771be7e73eb7e6b1.ctex"
metadata={
"vram_texture": false
}
               GST2   @   @      ����               @ @        �   RIFF�   WEBPVP8L�   /?� ��������jۊ\V�8�sRe���$0�$,������� ���tqU2פ�IR��T�z�jP�y�~���Z8fw^��Kr%��r�wX;G��pj�m-��Q�F�U�w�����6j�h��F�9��0�����V�˩$WR�A<fw^�]t�= �3BޡT�"�	�bV$) M��d�.�s              [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bax7lj17x02p5"
path="res://.godot/imported/O.png-f6bad6564a28e2574cab2711aedab841.ctex"
metadata={
"vram_texture": false
}
   GST2   @   @      ����               @ @        �   RIFF�   WEBPVP8L�   /?� ���������pZ�
=���� �!	����,D�
����׽�v��?0be�eXy�O�p������a+3��+3���WNB�¥�I������g�YV�����n{����Z�?;�S_�����#�fYV��g��+\4.z�$F�?�������0����W�p�؟Y`�a���'A�h�u���k��  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://4dj2mdaskq6e"
path="res://.godot/imported/X.png-a5bb159aaaacfed43e26aadbaba5f34a.ctex"
metadata={
"vram_texture": false
}
    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Scripts/Board.gd ��������
   Texture2D    res://Textures/X.png �D��W
   Texture2D    res://Textures/O.png ��O���!
   Texture2D    res://Textures/Board.png ����׷�d      local://RectangleShape2D_wsql8 �         local://PackedScene_3gakg          RectangleShape2D       
    �BC �@C         PackedScene          	         names "          Board    script    X    O    Node2D 	   Sprite2D 	   position    scale    texture    Area1    Area2D    CollisionShape2D    shape    Sprite    Area2    Area3    Area4    Area5    Area6    Area7    Area8    Area9    _on_area_1_input_event    input_event    _on_area_2_input_event    _on_area_3_input_event    _on_area_4_input_event    _on_area_5_input_event    _on_area_6_input_event    _on_area_7_input_event    _on_area_8_input_event    _on_area_9_input_event    	   variants    "                               
    ��C  �C
   ��?��?         
    ��B  �B          
     �B  �B
    ?@  <@
     �C  �B
    ��C  �B
     >@ =@
     �C  �B
    ��C  �B
     @@  <@
     �B ��C
     �B  �C
     >@  :@
     �C ��C
    ��C ��C
     �C `�C
     �C @�C
     >@��6@
     �B ��C
     �B ��C
     @@ ;@
    ��C ��C
    @�C ��C
    9@��>@
          �
     �C ��C
    ��C ��C
   ��8@ 9@      node_count             nodes     !  ��������       ����                                        ����                                 
   	   ����                     ����                                ����            	               
      ����                     ����      
                          ����                           
      ����                     ����                                ����                           
      ����                     ����                                ����                           
      ����                     ����                                ����                           
      ����                     ����                                ����                           
      ����                     ����                                ����                           
      ����                     ����                                ����                           
      ����                          ����                                ����             !             conn_count    	         conns     ?                                                                                                                                                                                                                                 node_paths              editable_instances              version             RSRC            GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://es4o2ip6ueq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Scripts/Menu.gd ��������      local://PackedScene_0wmh7          PackedScene          	         names "         Menu    script    Node2D    Panel    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical 	   Username    layout_mode    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    grow_horizontal    grow_vertical 	   TextEdit    StartButton    text    Button    _on_start_button_pressed    pressed    	   variants                      D     �D                              ?    ��    �L�    �C    ��           ��     ��     �B     �A      Start Game       node_count             nodes     X   ��������       ����                            ����                                            ����   	      
                                       	      
                                      ����   	      
                                                                                  conn_count             conns                                      node_paths              editable_instances              version             RSRC      [remap]

path="res://.godot/exported/133200997/export-a83cf8f48b1cf9ea574e7f03773d7d43-board.scn"
              [remap]

path="res://.godot/exported/133200997/export-a4951207776b25ee5c8b2b05c1463587-menu.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ����׷�d   res://Textures/Board.png��O���!   res://Textures/O.png�D��W   res://Textures/X.png7���BP�g   res://board.tscn�m�g!    res://icon.svg-2q�2"0   res://menu.tscn       ECFG      application/config/name      	   TicTacToe      application/run/main_scene         res://menu.tscn    application/config/features$   "         4.1    C#     Mobile     application/config/icon         res://icon.svg     autoload/ClientSide          *res://Scripts/Client.cs"   display/window/size/viewport_width      X  #   display/window/size/viewport_height            display/window/stretch/mode         viewport   display/window/stretch/aspect         ignore     dotnet/project/assembly_name      	   TicTacToe   #   rendering/renderer/rendering_method         mobile    