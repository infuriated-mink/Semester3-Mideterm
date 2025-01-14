PGDMP  8                    |            MidtermSprint-DB    16.1    16.1 r    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17048    MidtermSprint-DB    DATABASE     t   CREATE DATABASE "MidtermSprint-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
 "   DROP DATABASE "MidtermSprint-DB";
                postgres    false            �            1259    17053    address    TABLE     �   CREATE TABLE public.address (
    addressid integer NOT NULL,
    street character varying,
    city character varying,
    province character varying,
    postalcode character varying
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    17052    address_addressid_seq    SEQUENCE     �   CREATE SEQUENCE public.address_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.address_addressid_seq;
       public          postgres    false    217            �           0    0    address_addressid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.address_addressid_seq OWNED BY public.address.addressid;
          public          postgres    false    216            �            1259    17113    consoles    TABLE     �   CREATE TABLE public.consoles (
    consoleid integer NOT NULL,
    consolename character varying,
    manufacturer character varying,
    releasedate date
);
    DROP TABLE public.consoles;
       public         heap    postgres    false            �            1259    17112    consoles_consoleid_seq    SEQUENCE     �   CREATE SEQUENCE public.consoles_consoleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.consoles_consoleid_seq;
       public          postgres    false    227            �           0    0    consoles_consoleid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.consoles_consoleid_seq OWNED BY public.consoles.consoleid;
          public          postgres    false    226            �            1259    17099 	   customers    TABLE     �   CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying,
    lastname character varying,
    addressid integer,
    email character varying,
    phone character varying
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    17098    customers_customerid_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customers_customerid_seq;
       public          postgres    false    225            �           0    0    customers_customerid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;
          public          postgres    false    224            �            1259    17049    defaults    TABLE     2   CREATE TABLE public.defaults (
    gst integer
);
    DROP TABLE public.defaults;
       public         heap    postgres    false            �            1259    17090 
   difficulty    TABLE     m   CREATE TABLE public.difficulty (
    difficultyid integer NOT NULL,
    difficultylevel character varying
);
    DROP TABLE public.difficulty;
       public         heap    postgres    false            �            1259    17089    difficulty_difficultyid_seq    SEQUENCE     �   CREATE SEQUENCE public.difficulty_difficultyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.difficulty_difficultyid_seq;
       public          postgres    false    223            �           0    0    difficulty_difficultyid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.difficulty_difficultyid_seq OWNED BY public.difficulty.difficultyid;
          public          postgres    false    222            �            1259    17221 	   employees    TABLE       CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    firstname character varying,
    lastname character varying,
    positionid integer,
    addressid integer,
    email character varying,
    phone character varying,
    sin character varying,
    storeid integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    17220    employees_employeeid_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employees_employeeid_seq;
       public          postgres    false    241            �           0    0    employees_employeeid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employees_employeeid_seq OWNED BY public.employees.employeeid;
          public          postgres    false    240            �            1259    17122    games    TABLE     �   CREATE TABLE public.games (
    gameid integer NOT NULL,
    gametitle character varying,
    description character varying,
    releasedate date,
    price money,
    difficultyid integer
);
    DROP TABLE public.games;
       public         heap    postgres    false            �            1259    17121    games_gameid_seq    SEQUENCE     �   CREATE SEQUENCE public.games_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.games_gameid_seq;
       public          postgres    false    229            �           0    0    games_gameid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.games_gameid_seq OWNED BY public.games.gameid;
          public          postgres    false    228            �            1259    17205    gamesconsoles    TABLE     c   CREATE TABLE public.gamesconsoles (
    gameid integer NOT NULL,
    consoleid integer NOT NULL
);
 !   DROP TABLE public.gamesconsoles;
       public         heap    postgres    false            �            1259    17190    gamesgenres    TABLE     _   CREATE TABLE public.gamesgenres (
    genreid integer NOT NULL,
    gameid integer NOT NULL
);
    DROP TABLE public.gamesgenres;
       public         heap    postgres    false            �            1259    17182    genres    TABLE     ^   CREATE TABLE public.genres (
    genreid integer NOT NULL,
    genrename character varying
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    17181    genres_genreid_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genres_genreid_seq;
       public          postgres    false    237            �           0    0    genres_genreid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;
          public          postgres    false    236            �            1259    17136 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    inventoryid integer NOT NULL,
    gameconsoleid integer,
    quantity integer,
    purchaseprice money,
    saleprice money,
    dateadded date,
    storeid integer
);
    DROP TABLE public.inventory;
       public         heap    postgres    false            �            1259    17135    inventory_inventoryid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventory_inventoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inventory_inventoryid_seq;
       public          postgres    false    231            �           0    0    inventory_inventoryid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.inventory_inventoryid_seq OWNED BY public.inventory.inventoryid;
          public          postgres    false    230            �            1259    17076 	   positions    TABLE     |   CREATE TABLE public.positions (
    positionid integer NOT NULL,
    positionname character varying,
    storeid integer
);
    DROP TABLE public.positions;
       public         heap    postgres    false            �            1259    17075    positions_positionid_seq    SEQUENCE     �   CREATE SEQUENCE public.positions_positionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.positions_positionid_seq;
       public          postgres    false    221            �           0    0    positions_positionid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.positions_positionid_seq OWNED BY public.positions.positionid;
          public          postgres    false    220            �            1259    17062    stores    TABLE     �   CREATE TABLE public.stores (
    storeid integer NOT NULL,
    storename character varying,
    addressid integer,
    phone character varying,
    email character varying
);
    DROP TABLE public.stores;
       public         heap    postgres    false            �            1259    17061    stores_storeid_seq    SEQUENCE     �   CREATE SEQUENCE public.stores_storeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stores_storeid_seq;
       public          postgres    false    219            �           0    0    stores_storeid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stores_storeid_seq OWNED BY public.stores.storeid;
          public          postgres    false    218            �            1259    17165    transactiondetails    TABLE     �   CREATE TABLE public.transactiondetails (
    transactiondetailsid integer NOT NULL,
    transactionid integer,
    inventoryid integer,
    units integer,
    subtotalamount money
);
 &   DROP TABLE public.transactiondetails;
       public         heap    postgres    false            �            1259    17164 +   transactiondetails_transactiondetailsid_seq    SEQUENCE     �   CREATE SEQUENCE public.transactiondetails_transactiondetailsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.transactiondetails_transactiondetailsid_seq;
       public          postgres    false    235            �           0    0 +   transactiondetails_transactiondetailsid_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.transactiondetails_transactiondetailsid_seq OWNED BY public.transactiondetails.transactiondetailsid;
          public          postgres    false    234            �            1259    17153    transactions    TABLE     �   CREATE TABLE public.transactions (
    transactionid integer NOT NULL,
    customerid integer,
    transactiondate date,
    paymentamount money
);
     DROP TABLE public.transactions;
       public         heap    postgres    false            �            1259    17152    transactions_transactionid_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_transactionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transactions_transactionid_seq;
       public          postgres    false    233            �           0    0    transactions_transactionid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transactions_transactionid_seq OWNED BY public.transactions.transactionid;
          public          postgres    false    232            �           2604    17056    address addressid    DEFAULT     v   ALTER TABLE ONLY public.address ALTER COLUMN addressid SET DEFAULT nextval('public.address_addressid_seq'::regclass);
 @   ALTER TABLE public.address ALTER COLUMN addressid DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    17116    consoles consoleid    DEFAULT     x   ALTER TABLE ONLY public.consoles ALTER COLUMN consoleid SET DEFAULT nextval('public.consoles_consoleid_seq'::regclass);
 A   ALTER TABLE public.consoles ALTER COLUMN consoleid DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    17102    customers customerid    DEFAULT     |   ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);
 C   ALTER TABLE public.customers ALTER COLUMN customerid DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    17093    difficulty difficultyid    DEFAULT     �   ALTER TABLE ONLY public.difficulty ALTER COLUMN difficultyid SET DEFAULT nextval('public.difficulty_difficultyid_seq'::regclass);
 F   ALTER TABLE public.difficulty ALTER COLUMN difficultyid DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    17224    employees employeeid    DEFAULT     |   ALTER TABLE ONLY public.employees ALTER COLUMN employeeid SET DEFAULT nextval('public.employees_employeeid_seq'::regclass);
 C   ALTER TABLE public.employees ALTER COLUMN employeeid DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    17125    games gameid    DEFAULT     l   ALTER TABLE ONLY public.games ALTER COLUMN gameid SET DEFAULT nextval('public.games_gameid_seq'::regclass);
 ;   ALTER TABLE public.games ALTER COLUMN gameid DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    17185    genres genreid    DEFAULT     p   ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);
 =   ALTER TABLE public.genres ALTER COLUMN genreid DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    17139    inventory inventoryid    DEFAULT     ~   ALTER TABLE ONLY public.inventory ALTER COLUMN inventoryid SET DEFAULT nextval('public.inventory_inventoryid_seq'::regclass);
 D   ALTER TABLE public.inventory ALTER COLUMN inventoryid DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    17079    positions positionid    DEFAULT     |   ALTER TABLE ONLY public.positions ALTER COLUMN positionid SET DEFAULT nextval('public.positions_positionid_seq'::regclass);
 C   ALTER TABLE public.positions ALTER COLUMN positionid DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17065    stores storeid    DEFAULT     p   ALTER TABLE ONLY public.stores ALTER COLUMN storeid SET DEFAULT nextval('public.stores_storeid_seq'::regclass);
 =   ALTER TABLE public.stores ALTER COLUMN storeid DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17168 '   transactiondetails transactiondetailsid    DEFAULT     �   ALTER TABLE ONLY public.transactiondetails ALTER COLUMN transactiondetailsid SET DEFAULT nextval('public.transactiondetails_transactiondetailsid_seq'::regclass);
 V   ALTER TABLE public.transactiondetails ALTER COLUMN transactiondetailsid DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    17156    transactions transactionid    DEFAULT     �   ALTER TABLE ONLY public.transactions ALTER COLUMN transactionid SET DEFAULT nextval('public.transactions_transactionid_seq'::regclass);
 I   ALTER TABLE public.transactions ALTER COLUMN transactionid DROP DEFAULT;
       public          postgres    false    233    232    233            �          0    17053    address 
   TABLE DATA           P   COPY public.address (addressid, street, city, province, postalcode) FROM stdin;
    public          postgres    false    217   ֈ       �          0    17113    consoles 
   TABLE DATA           U   COPY public.consoles (consoleid, consolename, manufacturer, releasedate) FROM stdin;
    public          postgres    false    227   ̋       �          0    17099 	   customers 
   TABLE DATA           ]   COPY public.customers (customerid, firstname, lastname, addressid, email, phone) FROM stdin;
    public          postgres    false    225   d�                 0    17049    defaults 
   TABLE DATA           '   COPY public.defaults (gst) FROM stdin;
    public          postgres    false    215   �       �          0    17090 
   difficulty 
   TABLE DATA           C   COPY public.difficulty (difficultyid, difficultylevel) FROM stdin;
    public          postgres    false    223   /�       �          0    17221 	   employees 
   TABLE DATA           w   COPY public.employees (employeeid, firstname, lastname, positionid, addressid, email, phone, sin, storeid) FROM stdin;
    public          postgres    false    241   c�       �          0    17122    games 
   TABLE DATA           a   COPY public.games (gameid, gametitle, description, releasedate, price, difficultyid) FROM stdin;
    public          postgres    false    229   ɔ       �          0    17205    gamesconsoles 
   TABLE DATA           :   COPY public.gamesconsoles (gameid, consoleid) FROM stdin;
    public          postgres    false    239   �       �          0    17190    gamesgenres 
   TABLE DATA           6   COPY public.gamesgenres (genreid, gameid) FROM stdin;
    public          postgres    false    238   �       �          0    17182    genres 
   TABLE DATA           4   COPY public.genres (genreid, genrename) FROM stdin;
    public          postgres    false    237   !�       �          0    17136 	   inventory 
   TABLE DATA           w   COPY public.inventory (inventoryid, gameconsoleid, quantity, purchaseprice, saleprice, dateadded, storeid) FROM stdin;
    public          postgres    false    231   ��       �          0    17076 	   positions 
   TABLE DATA           F   COPY public.positions (positionid, positionname, storeid) FROM stdin;
    public          postgres    false    221   P�       �          0    17062    stores 
   TABLE DATA           M   COPY public.stores (storeid, storename, addressid, phone, email) FROM stdin;
    public          postgres    false    219   �       �          0    17165    transactiondetails 
   TABLE DATA           u   COPY public.transactiondetails (transactiondetailsid, transactionid, inventoryid, units, subtotalamount) FROM stdin;
    public          postgres    false    235   h�       �          0    17153    transactions 
   TABLE DATA           a   COPY public.transactions (transactionid, customerid, transactiondate, paymentamount) FROM stdin;
    public          postgres    false    233   ?�       �           0    0    address_addressid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.address_addressid_seq', 1, false);
          public          postgres    false    216            �           0    0    consoles_consoleid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.consoles_consoleid_seq', 1, false);
          public          postgres    false    226            �           0    0    customers_customerid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customerid_seq', 1, false);
          public          postgres    false    224            �           0    0    difficulty_difficultyid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.difficulty_difficultyid_seq', 1, false);
          public          postgres    false    222            �           0    0    employees_employeeid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.employees_employeeid_seq', 1, false);
          public          postgres    false    240            �           0    0    games_gameid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.games_gameid_seq', 1, false);
          public          postgres    false    228            �           0    0    genres_genreid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.genres_genreid_seq', 1, false);
          public          postgres    false    236            �           0    0    inventory_inventoryid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventory_inventoryid_seq', 1, false);
          public          postgres    false    230            �           0    0    positions_positionid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.positions_positionid_seq', 1, false);
          public          postgres    false    220            �           0    0    stores_storeid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.stores_storeid_seq', 1, false);
          public          postgres    false    218            �           0    0 +   transactiondetails_transactiondetailsid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.transactiondetails_transactiondetailsid_seq', 1, false);
          public          postgres    false    234            �           0    0    transactions_transactionid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transactions_transactionid_seq', 1, false);
          public          postgres    false    232            �           2606    17060    address address_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addressid);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    217            �           2606    17120    consoles consoles_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.consoles
    ADD CONSTRAINT consoles_pkey PRIMARY KEY (consoleid);
 @   ALTER TABLE ONLY public.consoles DROP CONSTRAINT consoles_pkey;
       public            postgres    false    227            �           2606    17106    customers customers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    225            �           2606    17097    difficulty difficulty_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.difficulty
    ADD CONSTRAINT difficulty_pkey PRIMARY KEY (difficultyid);
 D   ALTER TABLE ONLY public.difficulty DROP CONSTRAINT difficulty_pkey;
       public            postgres    false    223            �           2606    17228    employees employees_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    241            �           2606    17129    games games_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (gameid);
 :   ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
       public            postgres    false    229            �           2606    17209     gamesconsoles gamesconsoles_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.gamesconsoles
    ADD CONSTRAINT gamesconsoles_pkey PRIMARY KEY (gameid, consoleid);
 J   ALTER TABLE ONLY public.gamesconsoles DROP CONSTRAINT gamesconsoles_pkey;
       public            postgres    false    239    239            �           2606    17194    gamesgenres gamesgenres_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.gamesgenres
    ADD CONSTRAINT gamesgenres_pkey PRIMARY KEY (genreid, gameid);
 F   ALTER TABLE ONLY public.gamesgenres DROP CONSTRAINT gamesgenres_pkey;
       public            postgres    false    238    238            �           2606    17189    genres genres_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    237            �           2606    17141    inventory inventory_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public            postgres    false    231            �           2606    17083    positions positions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (positionid);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            postgres    false    221            �           2606    17069    stores stores_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (storeid);
 <   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_pkey;
       public            postgres    false    219            �           2606    17170 *   transactiondetails transactiondetails_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.transactiondetails
    ADD CONSTRAINT transactiondetails_pkey PRIMARY KEY (transactiondetailsid);
 T   ALTER TABLE ONLY public.transactiondetails DROP CONSTRAINT transactiondetails_pkey;
       public            postgres    false    235            �           2606    17158    transactions transactions_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transactionid);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public            postgres    false    233            �           1259    17245    idx_customer_phone_purchases    INDEX     t   CREATE INDEX idx_customer_phone_purchases ON public.customers USING btree (phone, firstname, lastname, customerid);
 0   DROP INDEX public.idx_customer_phone_purchases;
       public            postgres    false    225    225    225    225            �           1259    17246    idx_employee_phone_info    INDEX     �   CREATE INDEX idx_employee_phone_info ON public.employees USING btree (phone, firstname, lastname, positionid, storeid, employeeid);
 +   DROP INDEX public.idx_employee_phone_info;
       public            postgres    false    241    241    241    241    241    241            �           2606    17107 "   customers customers_addressid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_addressid_fkey FOREIGN KEY (addressid) REFERENCES public.address(addressid);
 L   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_addressid_fkey;
       public          postgres    false    3523    217    225            �           2606    17234 "   employees employees_addressid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_addressid_fkey FOREIGN KEY (addressid) REFERENCES public.address(addressid);
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_addressid_fkey;
       public          postgres    false    217    3523    241            �           2606    17229 #   employees employees_positionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_positionid_fkey FOREIGN KEY (positionid) REFERENCES public.positions(positionid);
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_positionid_fkey;
       public          postgres    false    241    221    3527            �           2606    17239     employees employees_storeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_storeid_fkey FOREIGN KEY (storeid) REFERENCES public.stores(storeid);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_storeid_fkey;
       public          postgres    false    219    3525    241            �           2606    17130    games games_difficultyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_difficultyid_fkey FOREIGN KEY (difficultyid) REFERENCES public.difficulty(difficultyid);
 G   ALTER TABLE ONLY public.games DROP CONSTRAINT games_difficultyid_fkey;
       public          postgres    false    3529    229    223            �           2606    17215 *   gamesconsoles gamesconsoles_consoleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gamesconsoles
    ADD CONSTRAINT gamesconsoles_consoleid_fkey FOREIGN KEY (consoleid) REFERENCES public.consoles(consoleid);
 T   ALTER TABLE ONLY public.gamesconsoles DROP CONSTRAINT gamesconsoles_consoleid_fkey;
       public          postgres    false    227    3534    239            �           2606    17210 '   gamesconsoles gamesconsoles_gameid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gamesconsoles
    ADD CONSTRAINT gamesconsoles_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);
 Q   ALTER TABLE ONLY public.gamesconsoles DROP CONSTRAINT gamesconsoles_gameid_fkey;
       public          postgres    false    3536    229    239            �           2606    17200 #   gamesgenres gamesgenres_gameid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gamesgenres
    ADD CONSTRAINT gamesgenres_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);
 M   ALTER TABLE ONLY public.gamesgenres DROP CONSTRAINT gamesgenres_gameid_fkey;
       public          postgres    false    229    3536    238            �           2606    17195 $   gamesgenres gamesgenres_genreid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gamesgenres
    ADD CONSTRAINT gamesgenres_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid);
 N   ALTER TABLE ONLY public.gamesgenres DROP CONSTRAINT gamesgenres_genreid_fkey;
       public          postgres    false    3544    237    238            �           2606    17142 &   inventory inventory_gameconsoleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_gameconsoleid_fkey FOREIGN KEY (gameconsoleid) REFERENCES public.consoles(consoleid);
 P   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_gameconsoleid_fkey;
       public          postgres    false    227    3534    231            �           2606    17147     inventory inventory_storeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_storeid_fkey FOREIGN KEY (storeid) REFERENCES public.stores(storeid);
 J   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_storeid_fkey;
       public          postgres    false    219    231    3525            �           2606    17084     positions positions_storeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_storeid_fkey FOREIGN KEY (storeid) REFERENCES public.stores(storeid);
 J   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_storeid_fkey;
       public          postgres    false    3525    221    219            �           2606    17070    stores stores_addressid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_addressid_fkey FOREIGN KEY (addressid) REFERENCES public.address(addressid);
 F   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_addressid_fkey;
       public          postgres    false    3523    219    217            �           2606    17176 6   transactiondetails transactiondetails_inventoryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactiondetails
    ADD CONSTRAINT transactiondetails_inventoryid_fkey FOREIGN KEY (inventoryid) REFERENCES public.inventory(inventoryid);
 `   ALTER TABLE ONLY public.transactiondetails DROP CONSTRAINT transactiondetails_inventoryid_fkey;
       public          postgres    false    235    231    3538            �           2606    17171 8   transactiondetails transactiondetails_transactionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactiondetails
    ADD CONSTRAINT transactiondetails_transactionid_fkey FOREIGN KEY (transactionid) REFERENCES public.transactions(transactionid);
 b   ALTER TABLE ONLY public.transactiondetails DROP CONSTRAINT transactiondetails_transactionid_fkey;
       public          postgres    false    235    233    3540            �           2606    17159 )   transactions transactions_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 S   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_customerid_fkey;
       public          postgres    false    233    225    3531            �   �  x�=SKr�6]7N�H��O�Rb��hɔ<�+����R��v4��cd�K���I�){�d��{�>��gQ��Y��B�}�`���y�`S�$�aZ�"�Q�5����\����[X�cLVRD0�~��[��>ۓ��
(�-ƹ�A8цz�^���_�,<la��b2�DI�����V�feV��3.�"�L�r�]��
�t���re��`)� b\�}�O��"G���=��wX�;̋Dd���:�z,l�<����o/9��p�NEq�e8��А9��mqү�gQE7�R� �$Ù}���^.�U�Q�����#Xek�橐�=��I[�(�ql�OM϶�̓Ƌ\��H�B������fc���W7%�g7,!#�pE�Q�����t�]�������Ɵ�`��W>��mcߣ^'�Y8�G�c����L��/l�֗��4~Ĥbd�N�|�#�G:�wf�5P�虜��Go�{��X�d}=�6��.��H���2�ĄY��8�pJ��aO��]������4-1�r�9D2䩺�^�[�mw��B��]6�x�0`Ɯ	�o-x�<T��Nr%��%Di"q�r���9۶�ܮ�\�/[����f�r�0qi��G�o_>�}=�':��!�n�
DȯE�,U��|+��D���߹����@��0�4�ܞh_+G}�H�mq����k��2!w�bՙ'gm�K2
�Q�&���)���,��d�?~B� ��-      �   �   x�U�A
�0E�3���dF���U-d��)H4�z��-�����p��ե>�T�Ӹ�X��ٰ�@w�79?�Puf]����������{�4<���OT��ʃl{�r����\�V�W���ƹ��?ؒ4      �   �  x�MTMs�6=C�'zD���MIw��6;�Lv�K/�DK�)RKIN�_�g�I{��axx �g���vlf�4,W#���/���]F���*e�RE"����E��L��o����� �O��h���*�L	�J)U��K�y��:gΔ��kt;o�Ҝe�d/�D�w����x1��>-I��pV��^/�3�%E�r�T��w{� ��|	��˙C�ٲ����fm�f+�($����\�$�of��(�kg2RN���F�KV��x�*g�@ޢ*�|E㜦g�/~L�p��z��M���`.eΓ�^Ͳz��U����@%M�(j�;3|n���#q�2�L�*K*z��W��y	�*j��]�zԗ���|��L3V��q�e�S�˺�Dz�a���xonfUkg�ћd��,e�JU�9��q���58g[�,�����z<�?�&�
�D�<�D�=�yA�/�}�`���lj��E��d*-Y��e�3�z���@���1��u�]N�+gϙA���m�9�$�BGp�O�Ջi�^�FKY1��+��	W���8����$8��2��ϓv�X,KV�"�U�szX��枬c�\�jN��@{�'D�?o�r����
�(@�	z��D�/M���5�g[����*�f���B�%�h��+�oP�s N7�� ��l��*��"��T���<��4:.���@��`4W��Ξ��j��+�R2�U���bK���~A���3�wp��yݙA<�xR(����dB���%�~у�;8֍�ݺi�H)ńLe"=�󵻗���!�zw쮝S4��@�i��"2�~��xCoC\�y�����	Ǻ���-���)q���,���4ӵ��b!#�5���ug�~+��Q�T�Bѣ^ ���L�Y�uM�n�'��v�捰wL`[����%I�/|�Ō            x�34����� �      �   $   x�3�tM,��2��MM�,��2��H,J����� k��      �   V  x�EUɒ�6=7�*� o��8��s�q9�\ CQ�E�#��>�\9��f������!�s{��	���|/ysY����C�L�gF8V{n�hϼ�LMRV���	_�q��Tе�U���z]�k��bZ��g�%�� i�eB���hɄ�$*E�C�񝞇ו$)��~�M����w�%�2�y�=
ŤuLpI�W�>��"})�
���n�jޗ1�a�7$4#�`F*O�Hg�Ĭ�W��k���y�Ax:�
��a���hÔ�P�k�V�i_�0���e���>/i�d���4�y/M��m:�q�,�&A�Q��Kg3u͜�����>�?����].�	:����6�0b���f �Bj��Fk�KU�B�9�'4�$ 9����u
�xC�`�+ƥ��t�M3U��UM�q¶�'�ys@nվ���7+i�><h��"^C���ݩq_#�Gz�]O�]���\7�������d�	C�s�}1%.���Ch_��>��%�o����s����͹��V��E\g��9���$}L���o�q@�t|�W�f��������	����ia���]%����L_Z�� �rn�k>�eb�ZO��x�0���Lh�0#Kk��S<��
y?w�v��O㡭r�9���L	�<R!T���4�_��߶�c��{�����p�@p��,Sd*N�}y�����؅B�r�{*��|/_�.#�����$�kθ1 �vLa�H���}�i
�L��1��~.Ǿ釟��-7�§��%.�n���TP��h��N��������6��Ԃo
ê�5q!� kA�5=m���q�O%`%�o��րű�8l��8Y���5��"[�Ӈ|*y�ӥ��j�p܋s��74��J��*�3R��b��}�H@�=��2Ƹ�>L�{������/o�YR�J�$�9P�0@]IIK��1��2�C{16ˏCh�+VS���hAz��eP�8t�3.4����VMM����X��W���P\�a겛a��%a5?}�K6iL�87�W��ߖ��z����\�`d,������g��r��-bQ�L�9k9/�%]�qǨM�p�� �t�^��{���?":��      �   )  x��T�n�0<�_�_��_�͉��F��@�-QaJ4H*��G���X��_���-` �͝���]J�j�5L�
.�2�J2cD+�l�t�?g��J�r�<$4t=?�hH�4��"B[y�9��/SP|�2eC����}a�癐)��⥷VZ��+T����؁Â�>�{~�����A+$Q�D�̒���\�Տa�s�C���+�`�[I�k0�π��-X��h�gF�U�BFq�-�A!m�i;̰��'���[�Z�L�	A8���mU�c�ZI�9��̝X���ш�;[�y�)�9K����1��s�;aƍu���^��y��͈��n��L[����tX)c=�R	����]|����w-d��bUIC�"�DRI1ʕ����i��G��h�>i��
�y6d�Ţ�-���f�٠��EϚ�Q�\1)��qe7C����fLgcp-4����lr�,B���ک�A����z�ŧs�lDQ�J8��:��u~tH)m�����'8mi�e�r�Eq��������{vˤ��<qVxsf0ő7�g�����C�2*E�$\��l=���[��Ur/2��^�J7��v�q S����1
kV/�.?y|��8������{7Zu�go{�ₙ�9P���f�L�݃�ԫ;R��QZ�F
��i4�l�-�u�����y�E�Q���O�s�p�;�u� �(!|�Ug�D����9�n�FL�����cJb�Za�s�������	�o^��J��� ����y���4�(� T~fy���[��a>�^�=���V���;=W      �   �   x���Q B�uw0���:�L�q�u+�sϽZ�d��|/?˿�>����c|����?�C<�C<�C<��x4S35S35S35S3�)La
S���0�)La
S���07y<�3=�3=�3=�3�iLcӘ�4�1�iLcӘ�4�17y233333333333��`3��f0��`3��f07y:�3;�3;�3;�3�Y�b���,f1�Y�b���,f1���x���SK�      �   "   x�3�4�2�4�2�Ɯ�\&�&@�)W� 4�x      �   f   x�3�tL.����2�tL)K�+)-J�2�
p�2�t�2���-�I+2�.)J,IM��2�.�/*)��(���I����/*�/�24�������� ��^      �   �  x�MSIr�@<���uTh�_��w�r�˨ݛ�>��q�J�z��3��':b����wmNo��S��0�aC�8̌|lv��9u1rikmv��/�t*(�#z۱�P�T��c�Ph�V.�x���lǫ���6N����J7�
�Kg܈ 5�h#�C��J^�`�1EǕ�w�ø�������5|V�����<�kFN���K^G�%��n����<x﷠��$����5Z������E�U_�����AM���F���	�ޕ퉅o�Xﮅ��[q�9��!����	W�56��a��n���U�F�sE�C�����ϫ;
,�����W�m(�w�M�\뻐��j�:x�k��7ƒ��6�KU�\'���Y;<u�o6�/x�l�{m��-a�ב��&�_'��%      �   �  x�eT�r\1��~E��#�@�v��Z77����L�9'�~s�r�b�]я�������q����������vP�/F�d���/h�x<�z�X����������zЀ�g��F����io��c�#Z{$�]�{�����V���7�"��(�4�^AE%�@W�c�f�� �\����ܓPL�~�;�#)Β"WD^Xi��M���R��'UG�̨��`��ĖaT#\�+J=
�����$L��T�p�J	D�Z�B��խ �'������{�	�<�V�|V-�4��C�:w�,�[���mw�,?q`�n��~"a&\3�cL�>�L�a�m)L�g^-#_�E9f,�|��!Kr��V5���F^�Ī �=֒�V�,I�`UR��������y�������}ۂ�ew?? �'��      �   M  x�]�ٮ�6�����p/�����d�L&��n�ic#��<}�>#��KW��+Sx�����������x �9ъ�4V۹<�0�Y����ҧ�b��K����@sM��N���=\�\�l/c�W�P~��m>�G)��4J	��>{0Ӆ4�t��W�]�m�� N%�5#��)��Ig���9�)n
�7{N��چ&k�9�0�i|	S��^^�J�o�����RD���Vj�k����Ƽ���%��)V��;���-(�-6�ά�p�}��q�Q���x��T�B���i��lAC�6DjMd��!�t�Q�>�����a��j� ?l6�g-�$����8���:������v�����S��j�d��Z���fJ�O.�>�[��>J��HSs�s���YӿBBK�~�Ь('�T�����9��3���NB.���%b����=���^��HN\#�kWd��b�hIٯ)�X��hL�ExC[�w��w����{EK�~�݈�7 5�Ӫ	c�������?M���mZ�̀vz�5RH�+���Y^M8����]R���j@;C�Z����ǋ=�h���=��0V����OnE�]B��jq�g��Ї�zu�y�<,٭�k���?m�l��[P�!�(�ܷ���y3b�+){�>��̨"�%�aX���b�{O�YI�_x�;*)0�ڴx����sp�٦���/Vb���G<L�0��5�TIX��"�y����b�������=R0(�"�()4l#B����Ӗ}��Oj��?GH���]J"�T�a��h�[�!<�%n��)���p�(��K�澳G2״��S�ߥ�������      �   �  x�MSɍ 1{Cy�p$$�l�u����J�HA�x\\"���ejH0$�+�]S�	�\GKJ��'"1�C�,���w�W�l$��	mi��gd;+�q����+SY`H+�����j��������T�$����Q<�F��{m#� ̵Fd��d �1�e�V[���5n�uuPn��O��� }�~eHBs��\NƾvZ�(l3�!�U�� Jq7[�Lp����������;m�'s�}1-y2��ܔ-�ؘ�����$Em�1�# E�Ⱥ��z�.�)��=��$]����~5q����h[/M�C��M%ɒdFs~X���)�wZ��|j?Z$[ 2Um:11�`H�vA�
�����S�M�Bql.-����AY`�"�X�Θ�<���]�0_�S��1�;� ��ho8��C��ٻ&U�}x��V�w�+�wf���Of�r�KLUɂ��      �   �  x�UTM�� [�9�-*����/�3��,*	I��h&�䩣*�2Ț�]W9u��Uٍ������\X����<u��u�A�Y���i��A��/qZݏ`�4����\����}�z��Q����������m�TRmz5�S�l8�A(j>B�%�P��
�ޓuQ��S��lA��| 0<ZN׷҆�k���T>���J����''�׏90͇r
����:�;AS�-_�-Qc_�~^�SzM�9q�����6�� �ؗN0r`R�N��pb9��SxA��K�K�Jh/�+�=�V{����Z	��H��u���A8���~g��"�}g���3+|�?���쓼��wxoI��V�:�8������]�s[gwl�@��k��7)s�A!����\膀~W'�$�=�[B��Ӥ�W`��1�o��i�ʚ�砜�������#��(�^v?�dBf��-�޻l9�Z��
�e/����\)�^��?&��"�     