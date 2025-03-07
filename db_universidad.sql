PGDMP                         {            universidad    14.7    14.7 5    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    25055    universidad    DATABASE     j   CREATE DATABASE universidad WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE universidad;
                postgres    false            �            1259    25129    alumno_se_matricula_asignatura    TABLE     �   CREATE TABLE public.alumno_se_matricula_asignatura (
    id_alumno integer NOT NULL,
    id_asignatura integer NOT NULL,
    id_curso_escolar integer NOT NULL
);
 2   DROP TABLE public.alumno_se_matricula_asignatura;
       public         heap    postgres    false            �            1259    25105 
   asignatura    TABLE     �  CREATE TABLE public.asignatura (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos real NOT NULL,
    tipo character varying(100) NOT NULL,
    curso smallint NOT NULL,
    cuatrimestre smallint NOT NULL,
    id_profesor integer,
    id_grado integer NOT NULL,
    CONSTRAINT asignatura_tipo_check CHECK (((tipo)::text = ANY (ARRAY[('básica'::character varying)::text, ('obligatoria'::character varying)::text, ('optativa'::character varying)::text])))
);
    DROP TABLE public.asignatura;
       public         heap    postgres    false            �            1259    25104    asignatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asignatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.asignatura_id_seq;
       public          postgres    false    217            4           0    0    asignatura_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.asignatura_id_seq OWNED BY public.asignatura.id;
          public          postgres    false    216            �            1259    25123    curso_escolar    TABLE     �   CREATE TABLE public.curso_escolar (
    id integer NOT NULL,
    anyo_inicio smallint NOT NULL,
    anyo_fin smallint NOT NULL
);
 !   DROP TABLE public.curso_escolar;
       public         heap    postgres    false            �            1259    25122    curso_escolar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.curso_escolar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.curso_escolar_id_seq;
       public          postgres    false    219            5           0    0    curso_escolar_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.curso_escolar_id_seq OWNED BY public.curso_escolar.id;
          public          postgres    false    218            �            1259    25068    departamento    TABLE     i   CREATE TABLE public.departamento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    25067    departamento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.departamento_id_seq;
       public          postgres    false    212            6           0    0    departamento_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.departamento_id_seq OWNED BY public.departamento.id;
          public          postgres    false    211            �            1259    25098    grado    TABLE     c   CREATE TABLE public.grado (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.grado;
       public         heap    postgres    false            �            1259    25097    grado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grado_id_seq;
       public          postgres    false    215            7           0    0    grado_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.grado_id_seq OWNED BY public.grado.id;
          public          postgres    false    214            �            1259    25057    persona    TABLE     �  CREATE TABLE public.persona (
    id integer NOT NULL,
    nif character varying(9),
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50),
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character(1) NOT NULL,
    tipo character varying(8) NOT NULL,
    CONSTRAINT persona_sexo_check CHECK ((sexo = ANY (ARRAY['H'::bpchar, 'M'::bpchar]))),
    CONSTRAINT persona_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['profesor'::character varying, 'alumno'::character varying])::text[])))
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    25056    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public          postgres    false    210            8           0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public          postgres    false    209            �            1259    25082    profesor    TABLE     i   CREATE TABLE public.profesor (
    id_profesor integer NOT NULL,
    id_departamento integer NOT NULL
);
    DROP TABLE public.profesor;
       public         heap    postgres    false            }           2604    25108    asignatura id    DEFAULT     n   ALTER TABLE ONLY public.asignatura ALTER COLUMN id SET DEFAULT nextval('public.asignatura_id_seq'::regclass);
 <   ALTER TABLE public.asignatura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    25126    curso_escolar id    DEFAULT     t   ALTER TABLE ONLY public.curso_escolar ALTER COLUMN id SET DEFAULT nextval('public.curso_escolar_id_seq'::regclass);
 ?   ALTER TABLE public.curso_escolar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            {           2604    25071    departamento id    DEFAULT     r   ALTER TABLE ONLY public.departamento ALTER COLUMN id SET DEFAULT nextval('public.departamento_id_seq'::regclass);
 >   ALTER TABLE public.departamento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            |           2604    25101    grado id    DEFAULT     d   ALTER TABLE ONLY public.grado ALTER COLUMN id SET DEFAULT nextval('public.grado_id_seq'::regclass);
 7   ALTER TABLE public.grado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            x           2604    25060 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            -          0    25129    alumno_se_matricula_asignatura 
   TABLE DATA           d   COPY public.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) FROM stdin;
    public          postgres    false    220   QA       *          0    25105 
   asignatura 
   TABLE DATA           l   COPY public.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) FROM stdin;
    public          postgres    false    217   �A       ,          0    25123    curso_escolar 
   TABLE DATA           B   COPY public.curso_escolar (id, anyo_inicio, anyo_fin) FROM stdin;
    public          postgres    false    219   !G       %          0    25068    departamento 
   TABLE DATA           2   COPY public.departamento (id, nombre) FROM stdin;
    public          postgres    false    212   aG       (          0    25098    grado 
   TABLE DATA           +   COPY public.grado (id, nombre) FROM stdin;
    public          postgres    false    215   �G       #          0    25057    persona 
   TABLE DATA           �   COPY public.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) FROM stdin;
    public          postgres    false    210   �H       &          0    25082    profesor 
   TABLE DATA           @   COPY public.profesor (id_profesor, id_departamento) FROM stdin;
    public          postgres    false    213   %M       9           0    0    asignatura_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.asignatura_id_seq', 1, false);
          public          postgres    false    216            :           0    0    curso_escolar_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.curso_escolar_id_seq', 1, false);
          public          postgres    false    218            ;           0    0    departamento_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.departamento_id_seq', 1, false);
          public          postgres    false    211            <           0    0    grado_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grado_id_seq', 1, false);
          public          postgres    false    214            =           0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 1, false);
          public          postgres    false    209            �           2606    25133 B   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_pkey PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar);
 l   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_pkey;
       public            postgres    false    220    220    220            �           2606    25111    asignatura asignatura_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_pkey;
       public            postgres    false    217            �           2606    25128     curso_escolar curso_escolar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.curso_escolar
    ADD CONSTRAINT curso_escolar_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.curso_escolar DROP CONSTRAINT curso_escolar_pkey;
       public            postgres    false    219            �           2606    25073    departamento departamento_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    212            �           2606    25103    grado grado_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.grado
    ADD CONSTRAINT grado_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grado DROP CONSTRAINT grado_pkey;
       public            postgres    false    215            �           2606    25066    persona persona_nif_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_nif_key UNIQUE (nif);
 A   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_nif_key;
       public            postgres    false    210            �           2606    25064    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    210            �           2606    25086    profesor profesor_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id_profesor);
 @   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_pkey;
       public            postgres    false    213            �           2606    25134 L   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_alumno_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_alumno_fkey FOREIGN KEY (id_alumno) REFERENCES public.persona(id);
 v   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_alumno_fkey;
       public          postgres    false    220    3203    210            �           2606    25139 P   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_asignatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_asignatura_fkey FOREIGN KEY (id_asignatura) REFERENCES public.asignatura(id);
 z   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_asignatura_fkey;
       public          postgres    false    3211    217    220            �           2606    25144 S   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_curso_escolar_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_curso_escolar_fkey FOREIGN KEY (id_curso_escolar) REFERENCES public.curso_escolar(id);
 }   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_curso_escolar_fkey;
       public          postgres    false    219    3213    220            �           2606    25117 #   asignatura asignatura_id_grado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_grado_fkey FOREIGN KEY (id_grado) REFERENCES public.grado(id);
 M   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_id_grado_fkey;
       public          postgres    false    3209    217    215            �           2606    25112 &   asignatura asignatura_id_profesor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesor(id_profesor);
 P   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_id_profesor_fkey;
       public          postgres    false    3207    213    217            �           2606    25092 &   profesor profesor_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id);
 P   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_id_departamento_fkey;
       public          postgres    false    212    213    3205            �           2606    25087 "   profesor profesor_id_profesor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.persona(id);
 L   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_id_profesor_fkey;
       public          postgres    false    213    3203    210            -   b   x�-��� �7�>���_G�7�t��fͺ5��s���k�Z���MN#q����v�"#2"#2"#2"#2"#2�+sp�������{��?[�#/      *   N  x��WKr�8\ç�	R"EI�ұ�W����U6	qPE
:���(^z�Ŕ�����T\�Xd���6C���g,�4�y�h<U�h�Oh��*�LQ�&���#�oIⳈ\6�yR�b�2��vI��W�(8P��^�֨�VLnJ%EZ'	o�� ހ(�*�y�;cE�Ȍ�������U������*Zy�[�O��)��Y���u�j8�(��"Y�J��D����sr]�)-X�De\�Y�$��9mK�j�2����晐ͫ*�Xm;\�[�D���d��\��5G &$�.�ADm�¨�௨��)��rU��xb���$�q��g�JΤ�1�^���y���<�
�Ga�T��x�=a������?
�_���b�1�A�.E�w<�ر'E�g�=q��1݄�%w9:y�\/����;)�P9�A7H�x��hA���-<0����h#�Br���R��T�:�=Ml4uUS�ň�t���Q��]�m��A�RY·Ϛ�{Ei:����_����&���0VX' �d3��V�Q d��W��_z2����s�1\�����&,�%Oi�#��8���R�����ܸ6�14����� _?�Ώ�'\a��-�i�D����;/u� i�Kx۫��MUJ'��ZbH�d���A�a�͋�ʆ</SS���{���p��[K�]��ʹ�:V��(������O\��,�]���&wL�}�"�p���6����D q���.�&�-p�J��9��+m���ҭUU@Bg\���"�$>��Z��Y�]�Ÿ�r�E��n2"ל�x��`_<�9��9�W�+���Y� j$�SR��Ug�de�c��e(��,��_���$T��0�&�Z���
����7��I��@%E�礟B��%u�uj\����]a���x�'ܦ��/~�x_�#?;����p���#��j����uN�hels�:n�޷�nm����"�ͫ��=:����`Bf��dmt�M���#˘2J�)F���p�	�[�^�u/!�3�׋Q�7^THnyEv�yAȻP6��f(n"r�Y�,�����E�]A!��mY����r�R�g�1ò)�hvqO�;бj�,�7c
(���vhq�n���¦��Sێ������o�u�U��?\����1�F���qT#W���j�IZ#Ê�]=����	(e�oi�������o�Ӽhƙ���R�IV5�bz;�^.n<s�q1k��kl='�ސ��4��K��?!h��ۑ9�6�1���b]Q��&�B�=o��Tb/k�Y4Y�5v��OdG�D��Â3��Nu��Νfn�ɧO�Y��>��'��D\�>�����M�D      ,   0   x�3�4204�\F`
D�q�)a��6\`ia����� P�
      %   �   x�3���K�/�=��$39�ˈ�7�$�+�2�tM����=�6Q�R�5��(�8�˄�5�4919���<.SN��"�.3����ks�z����-�i�閙����Ra��Z�����e��	*vO������� ��7E      (   �   x�}ϱ�0��>EGY ��h�a �ݥ��4)��1:0�}1Kb($����_��ԬP�fX
�M�hZڇ+���*��b����,͋�Z���<����b���gX���2颾G��h�OUW�ӳU�X��s����w��֚���i�bG�4pTR�Cr����I r��V��LB3Z?�H�l�4|kf[ߡ��t�}C� �v�n      #   H  x�uU�r�6]_�~@-�$�t��K�r�I&��-$���S�o��"��Տ��VlQ��hF3�xpp��2�ȸ���z��i��Z�K�D��o_�����wKG�����FW�nm�>�l�*Tƕ4"'Vl��17tF��Vu8�d
%�dŜ�v��A �q�v�<s�� I����uB�����&�1�)��>GWv�ɉۃ��u=�b�E�b�hÝkB<��r����-b�3WU.ҥ��� �i#���]wo����,��,gꕞ"�N�F_ӱ}���˕_�t�%�w!o\�5�s���LqY�8��rԔI.���{z��7:MC��=���׾ŏ�!Udi�=�99W�i}No��u��_�u��bn��n�vuH7���\��ʡ�(4�����ז�n��t-�|�b 8�m�u�{+�_<O�p�+NA��U�Γ̛5ԉOឮ�[�V�q �.�ʵPL�"��c��Y��x
�E�"�K|O�g�`���tj��P�ه1��O�y�@��c�����/m��Г���F�/\=q�s���Q�1�/:�q��$����|�!h��B�[������Q9Żw�- �[8�[�,@���?���Vw��ǔqS��l�y����I�U�<WlB3(Q!K�fU��On(�q��sm�bm��| ��d����^w�l�z�)��UpC�����*�'X�%*�LP��4*��9�m��9�v	�G�n����1̽�Ѣ�FUhF�����5��6�?�ȡҊ�:�I�S��������n�#q�d�5�"���Wh�.\!0d_"���v	��:�<�L�Z���\+	 V'��aa
5�����+�����Fq�K� LO��6u�V\
�m�"�b�����s&31�SĳtMi{�`q`��o��#��<D����1}Ɋ�ې鼀!U��^*���XWiL7?�{kk
�	��c��㟌9I&�Ev�b���|�ﻴe`ܘ��~doC��M��:�f[���/H�\	�&�����p@O;'�q�`��Pj6#��|n��;�3k�O1�PG74oۯī�?�b���0��~i�T�������c�      &   5   x�ɹ  �XW�l�b�p�ɦ�Tp��k�(R�����G��o��#     