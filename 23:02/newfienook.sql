PGDMP      9                |            newfie_nook    16.1    16.1 7    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    17301    newfie_nook    DATABASE     m   CREATE DATABASE newfie_nook WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE newfie_nook;
                postgres    false            �            1259    17307    address    TABLE     A  CREATE TABLE public.address (
    address_id integer NOT NULL,
    street_address character varying(30) NOT NULL,
    city character varying(25) NOT NULL,
    province character varying(25) NOT NULL,
    postal_code character varying(8) NOT NULL,
    address_type character varying(30) NOT NULL,
    person_id integer
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    17495    customer    TABLE     c   CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    person_id integer NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    17325    customerAccount    TABLE     �   CREATE TABLE public."customerAccount" (
    account_id integer NOT NULL,
    person_id integer NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(15) NOT NULL,
    payment_information text NOT NULL
);
 %   DROP TABLE public."customerAccount";
       public         heap    postgres    false            �            1259    17399    orderInvoice    TABLE     �   CREATE TABLE public."orderInvoice" (
    invoice_id integer NOT NULL,
    person_id integer NOT NULL,
    date date NOT NULL,
    shipping_information text NOT NULL
);
 "   DROP TABLE public."orderInvoice";
       public         heap    postgres    false            �            1259    17302    person    TABLE     �   CREATE TABLE public.person (
    person_id integer NOT NULL,
    person_name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    phone_number character varying(20) NOT NULL,
    person_type character varying(10) NOT NULL
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    17482    person_address_join    TABLE     m   CREATE TABLE public.person_address_join (
    person_id integer NOT NULL,
    address_id integer NOT NULL
);
 '   DROP TABLE public.person_address_join;
       public         heap    postgres    false            �            1259    17337    product    TABLE     �   CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    description text,
    price money NOT NULL,
    image character varying,
    category_id integer NOT NULL,
    person_id integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17344    productCategory    TABLE     ~   CREATE TABLE public."productCategory" (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);
 %   DROP TABLE public."productCategory";
       public         heap    postgres    false            �            1259    17349    productCategory_Product_join    TABLE     z   CREATE TABLE public."productCategory_Product_join" (
    product_id integer NOT NULL,
    category_id integer NOT NULL
);
 2   DROP TABLE public."productCategory_Product_join";
       public         heap    postgres    false            �            1259    17429    product_order    TABLE     h   CREATE TABLE public.product_order (
    product_id integer NOT NULL,
    invoice_id integer NOT NULL
);
 !   DROP TABLE public.product_order;
       public         heap    postgres    false            �            1259    17505    vendor    TABLE     �   CREATE TABLE public.vendor (
    vendor_id integer NOT NULL,
    person_id integer NOT NULL,
    vendor_name character varying NOT NULL
);
    DROP TABLE public.vendor;
       public         heap    postgres    false            �            1259    17377    vendorAccount    TABLE     �   CREATE TABLE public."vendorAccount" (
    account_id integer NOT NULL,
    person_id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);
 #   DROP TABLE public."vendorAccount";
       public         heap    postgres    false            �            1259    17416    vendor_products_join    TABLE     n   CREATE TABLE public.vendor_products_join (
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
 (   DROP TABLE public.vendor_products_join;
       public         heap    postgres    false            T          0    17307    address 
   TABLE DATA           s   COPY public.address (address_id, street_address, city, province, postal_code, address_type, person_id) FROM stdin;
    public          postgres    false    216   �D       ^          0    17495    customer 
   TABLE DATA           :   COPY public.customer (customer_id, person_id) FROM stdin;
    public          postgres    false    226   �F       U          0    17325    customerAccount 
   TABLE DATA           k   COPY public."customerAccount" (account_id, person_id, username, password, payment_information) FROM stdin;
    public          postgres    false    217   G       Z          0    17399    orderInvoice 
   TABLE DATA           [   COPY public."orderInvoice" (invoice_id, person_id, date, shipping_information) FROM stdin;
    public          postgres    false    222   H       S          0    17302    person 
   TABLE DATA           Z   COPY public.person (person_id, person_name, email, phone_number, person_type) FROM stdin;
    public          postgres    false    215   �H       ]          0    17482    person_address_join 
   TABLE DATA           D   COPY public.person_address_join (person_id, address_id) FROM stdin;
    public          postgres    false    225   K       V          0    17337    product 
   TABLE DATA           n   COPY public.product (product_id, product_name, description, price, image, category_id, person_id) FROM stdin;
    public          postgres    false    218   cK       W          0    17344    productCategory 
   TABLE DATA           G   COPY public."productCategory" (category_id, category_name) FROM stdin;
    public          postgres    false    219   �O       X          0    17349    productCategory_Product_join 
   TABLE DATA           Q   COPY public."productCategory_Product_join" (product_id, category_id) FROM stdin;
    public          postgres    false    220   2P       \          0    17429    product_order 
   TABLE DATA           ?   COPY public.product_order (product_id, invoice_id) FROM stdin;
    public          postgres    false    224   ~P       _          0    17505    vendor 
   TABLE DATA           C   COPY public.vendor (vendor_id, person_id, vendor_name) FROM stdin;
    public          postgres    false    227   �P       Y          0    17377    vendorAccount 
   TABLE DATA           T   COPY public."vendorAccount" (account_id, person_id, username, password) FROM stdin;
    public          postgres    false    221   >Q       [          0    17416    vendor_products_join 
   TABLE DATA           E   COPY public.vendor_products_join (person_id, product_id) FROM stdin;
    public          postgres    false    223   R       �           2606    17331 $   customerAccount customerAccount_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."customerAccount"
    ADD CONSTRAINT "customerAccount_pkey" PRIMARY KEY (account_id);
 R   ALTER TABLE ONLY public."customerAccount" DROP CONSTRAINT "customerAccount_pkey";
       public            postgres    false    217            �           2606    17311    address customerAddress_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "customerAddress_pkey" PRIMARY KEY (address_id);
 H   ALTER TABLE ONLY public.address DROP CONSTRAINT "customerAddress_pkey";
       public            postgres    false    216            �           2606    17306    person customer_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.person
    ADD CONSTRAINT customer_pkey PRIMARY KEY (person_id);
 >   ALTER TABLE ONLY public.person DROP CONSTRAINT customer_pkey;
       public            postgres    false    215            �           2606    17499    customer customer_pkey1 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey1 PRIMARY KEY (customer_id);
 A   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey1;
       public            postgres    false    226            �           2606    17405    orderInvoice orderInvoice_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."orderInvoice"
    ADD CONSTRAINT "orderInvoice_pkey" PRIMARY KEY (invoice_id);
 L   ALTER TABLE ONLY public."orderInvoice" DROP CONSTRAINT "orderInvoice_pkey";
       public            postgres    false    222            �           2606    17348 $   productCategory productCategory_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."productCategory"
    ADD CONSTRAINT "productCategory_pkey" PRIMARY KEY (category_id);
 R   ALTER TABLE ONLY public."productCategory" DROP CONSTRAINT "productCategory_pkey";
       public            postgres    false    219            �           2606    17343    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            �           2606    17383     vendorAccount vendorAccount_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."vendorAccount"
    ADD CONSTRAINT "vendorAccount_pkey" PRIMARY KEY (account_id);
 N   ALTER TABLE ONLY public."vendorAccount" DROP CONSTRAINT "vendorAccount_pkey";
       public            postgres    false    221            �           2606    17511    vendor vendor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (vendor_id);
 <   ALTER TABLE ONLY public.vendor DROP CONSTRAINT vendor_pkey;
       public            postgres    false    227            �           2606    17490 !   person_address_join address_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_address_join
    ADD CONSTRAINT address_id_fk FOREIGN KEY (address_id) REFERENCES public.address(address_id) NOT VALID;
 K   ALTER TABLE ONLY public.person_address_join DROP CONSTRAINT address_id_fk;
       public          postgres    false    3493    225    216            �           2606    17467    product category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES public."productCategory"(category_id) NOT VALID;
 =   ALTER TABLE ONLY public.product DROP CONSTRAINT category_id;
       public          postgres    false    218    3499    219            �           2606    17357 +   productCategory_Product_join category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."productCategory_Product_join"
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public."productCategory"(category_id) NOT VALID;
 W   ALTER TABLE ONLY public."productCategory_Product_join" DROP CONSTRAINT category_id_fk;
       public          postgres    false    219    220    3499            �           2606    17437    product_order invoice_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_order
    ADD CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id) REFERENCES public."orderInvoice"(invoice_id) NOT VALID;
 E   ALTER TABLE ONLY public.product_order DROP CONSTRAINT invoice_id_fk;
       public          postgres    false    222    224    3503            �           2606    17512    vendor person_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(person_id);
 :   ALTER TABLE ONLY public.vendor DROP CONSTRAINT person_id;
       public          postgres    false    227    215    3491            �           2606    17442    address person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT person_id_fk;
       public          postgres    false    215    3491    216            �           2606    17447    vendorAccount person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."vendorAccount"
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 F   ALTER TABLE ONLY public."vendorAccount" DROP CONSTRAINT person_id_fk;
       public          postgres    false    3491    215    221            �           2606    17452 !   vendor_products_join person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor_products_join
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 K   ALTER TABLE ONLY public.vendor_products_join DROP CONSTRAINT person_id_fk;
       public          postgres    false    215    223    3491            �           2606    17462    orderInvoice person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."orderInvoice"
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 E   ALTER TABLE ONLY public."orderInvoice" DROP CONSTRAINT person_id_fk;
       public          postgres    false    215    222    3491            �           2606    17472    product person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT person_id_fk;
       public          postgres    false    218    3491    215            �           2606    17477    customerAccount person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."customerAccount"
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;
 H   ALTER TABLE ONLY public."customerAccount" DROP CONSTRAINT person_id_fk;
       public          postgres    false    3491    217    215            �           2606    17485     person_address_join person_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_address_join
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id);
 J   ALTER TABLE ONLY public.person_address_join DROP CONSTRAINT person_id_fk;
       public          postgres    false    215    3491    225            �           2606    17500    customer person_id_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT person_id_fk FOREIGN KEY (person_id) REFERENCES public.person(person_id);
 ?   ALTER TABLE ONLY public.customer DROP CONSTRAINT person_id_fk;
       public          postgres    false    226    215    3491            �           2606    17352 *   productCategory_Product_join product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."productCategory_Product_join"
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 V   ALTER TABLE ONLY public."productCategory_Product_join" DROP CONSTRAINT product_id_fk;
       public          postgres    false    220    218    3497            �           2606    17432    product_order product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_order
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 E   ALTER TABLE ONLY public.product_order DROP CONSTRAINT product_id_fk;
       public          postgres    false    224    3497    218            �           2606    17457 "   vendor_products_join product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor_products_join
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id) NOT VALID;
 L   ALTER TABLE ONLY public.vendor_products_join DROP CONSTRAINT product_id_fk;
       public          postgres    false    3497    223    218            T     x�u�Ɏ�0D�ͯ�\D-G/���O`�\:m�I������'˗\DR�uW�$ԍ4|n��.��|r��da�0t|�G�eX��w;P4F
Ƚ;]�A�T��˩�1�5��o0E?�CLV�n��J�Ҍʚi(�Ѥ�z{�G�Ķ�y�	���i�(u���w�Ԭ QJ�OCϗ,���!�Ŷ��>&�!h-�'�f��S��niҜ>s��(T�D�J����C<���}M/c擰��f��wۘ�C 7j9bKVA�E]�YL����4�/Ɇ֞�Bfۘv$�BO3K�jP��%-z	|���y�i�tf��Hw�*]J5*ր�H�S�����w��ǞDkB��3޿ )��d��|N,Zy�����&~�+]+��1Ť�W�o½�s�?�o(�R�
E=|AJ5n��o��WMz�ȒqՊI�R�_�`�}|Bo�`A4�Jic@(�B�#�`����Er��Ғ/�w�IrodԆ�9
#o���ʦ��=_{|CxA��'w�Gr�h�-M=JٯO��?_�R      ^   *   x���  ��w;�w�ø�&�68&��Z��m3�[�W�      U   �   x�e��j�@���kt��P�k"�TA*�Zj6m �̌W�Ih�>|g����p�zH�;�� ���v�>u뢠�)��b�HZ0�u|�P�I�xې��J�gy�Y�Z�J���!�f�/�Ѳ�BD�6��އ|q�ׯ�y�E��꣨H��E2\�r�'L�Eն��l��Uu��e�r0E����N�1N{�j;mkwp��ϳ0������Kl��J?�2ž��ţ�8��d~      Z   �   x�UO�
�0<O�%�ټς�x�Rhob�V����43;����F3�{�ӭ_�Y	�?�ӆ�D\����
I��4���R�ga��m�G��/�}�ʚ�	#�����	�jS�ű��C�M�Ee�ٔ"iK�Nm�Ȏ"\��ښ�P��f �5()~][4؁�w�.ăn-��I��Ro��R�      S   >  x�MR�n�0���B['
�(�䦦Ep �t��g�	Ee'_Zv�L���ݽ��U���{ՙ�3L����ƣ�z̵��f��J���
�z6%<)k��~T���+����`1��lH�8����9�	Æ�w��&{P��!����l'����.���!�f���ˎ
��_�f/�%j�0/������.h%Hդ5��j��稲mzj@O�Q�q�	w>�s��$�ɚH��'��G��~/A����3�[7��r�����D���n�03g��qv�i4�
���>P�Ԕ����(�N�m������&��
y���Y?�+�V�cѐ���Ɨp�!�*;�9&B�}B�vf�*D����H7D��j;]�Q��;��N�a�]�l?|�M87�.I#K"(��M)l��t��Ѹag��0�W�RmVrC)E�\�&���<*=b��~���!���vT�JW�_�)J��$L����&��aq1����-.��U��:U5U�֢��`�RU.{�1z�q�}��R�S� �����z��p<A�.E��>�Э[3�C�hIcU�[_4��7����)�      ]   >   x�˹ 1���(�Ɣ,?���:N1GB���2W�R�T�R������x��lrO݊�?�:
*      V   1  x��V�n�F<��b>
�HQ2��'��*�=�2"�R'�zB�����| �K�P�&ُ��j��`�
��x�N9D'U�<��K��@ZG/=�9�&��b_ȏ*:�2j��ֺts�.=�A���4�^!���"I��(5�ٵt1�-�=Z�Bz-;5�QT�9��u���9���G����^��hm�Xn���M1����k��!��ZU�Wۏ��B�T���_��z$Hj]!�CyO�
�D>(\R��7žY�\�O�̻WUuݜy'��j+
���Y6R���c�= k`$�ܭek�����6�W�O����6�^�J�}!���j�yK��w�_����%�v7��v�c���U->k����Z|0c�?�6�N-���ִ�)���K�p���y|c����@+�qK�+PaU�K6�B���W;q��ߐ!� ng� ��Β�I����P;��Zo����( v���T�ϛ����ZY���M>�����B�"D�}��gǋ�Q`� 6}�W<l��Rުj�Bs���i/.ɘ�@�!oM>�Ne�q���?����������'��S����0	7��0f�G먟,b��<���ۀ	�#���-���tC����`}~Z ��$�3*���#�uFn'��02RMVS�O ���soʥ��R�b{Y���5HHf	Ӫ|^�L�*7�[e����q5r�ia\O^�i��IDS�YQ���B�L�{�R�ͥ��1,$x�`=DC��G֬d���������	�wQ:	B<�fqx�z��'Q�r���X�E���jq�U��J|hI���~�,W�Qm�:���}�3���6@�<,4�Mn4׼-�F�
]�uou"�q&�9rIڐ��L䅃�m�^���hv�B��{or���2��g�6G`H�[���=�j�דř<.�04*<��,m�R��*L�T֣A�=8���
�н_�0��1����Ҹ�����C�6ʥ��tw}Ζ|!E�՗K,���u��Q�����8`�<�L��*�p$G*�����a��4'W6���h㜊�]Q.ʾ^�يf�{�Z����      W   ~   x�-�=� �z�SP�tL�/N�� 6��a��������Z��SAG}��4�e~ՂY��i��/��#���Q���sHؓӔ³�#s�Rp�!J0ˈ#�~��e.�}�k������
��;'�      X   <   x��� 1�jq�C�8�.��s�J�6�n:u��`֛Oˍ�m�25�~TN	A      \   <   x�ʹ�0İxY�G<����:l�0N�HOaKgfr��X�l�\�2�Q46����}���
*      _   d   x��;�0����D�c�8 }\����
E�P��I9���.��@�W����!'���{H����/:��-ռ�y�X����q�"�����>�4O�      Y   �   x�%�M�@ �����^��#�I!HdV��0y����b�=��0�0`���LݦPl�g�����Ѝ"Y87�P���K-`�U�h�{&��ɹ�o]��9�F:��IJD`�i �.��z�0꒞:Q$l�������8��}��:�V�a�]X���e�T�4�<�8�������9
      [   ?   x����0��0L/���٥���8?����RD��4)��)�m�Fw˷�#�作��)�]��)y     