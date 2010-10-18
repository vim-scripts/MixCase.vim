import string, re, random
class MixCase:
    __rangeLines = []
    __mixedText = []
    __mixTable=[]

    def __init__(self, curRange):
        for line in curRange:
            self.__rangeLines = self.__rangeLines + [line]
            self.__mixedText = []
            self.__mixTable=[]

    def MixCambridge(self,level='0'):
        """ Mixes center letters of each word of the range

        """
        if level=='0' or level == 'Crgimdbae':
            level='Crgimdbae'
        else:
            level='Cabdgimre'
        for line in self.__rangeLines:
            lstWords = self.__megaSplit(line)
            for word in lstWords:
                if word != '':
                    lettres = []
                    for i in range(len(word)):
                        lettres = lettres + [word[i]]
                    lettresCentre=lettres[1:-1]
                    if lettresCentre != []:
                        if level == 'Cabdgimre':
                            lettresCentre.sort()
                        else:
                            random.shuffle(lettresCentre)
                        lettres[1:-1]=lettresCentre
                        motMelange=''
                        for l in lettres:
                            motMelange=motMelange+l
                        line = string.replace(line,word,motMelange,1)
            self.__mixedText = self.__mixedText + [line]
        return self.__mixedText

    def MixHackerz (self,level='2',printLevel=1):
        """ Mixes the case of the letters of the selected text in a Hacker way. The level gives different mix tables

            Parameters level            = complexity level of MixCase
                       printLevel       = Is the level printed when the command is executed
        """
        if level=='5' or level == 'j3��qBEF':
            level = 'j3��qBEF'
            self.__rangeLines = self.MixCambridge()
            self.__mixedText = []
        elif level=='4' or level == 'j�3��3QF':
            level = 'j�3��3QF'
        elif level=='3' or level == 'WD�L��rz':
            level = 'WD�L��rz'
            self.__rangeLines = self.MixCambridge()
            self.__mixedText = []
        elif level=='2' or level == 'WaR��R�Z':
            level = 'WaR��R�Z'
        elif level=='1' or level == 'CoWb0yZ':
            level = 'CoWb0yZ'
        else:
            level = 'ROokIE'
        if printLevel:
            print level
        self.__LoadMixTable(level)
        for line in self.__rangeLines:
            lstWords = self.__megaSplit(line)
            for word in lstWords:
                if word != '':
                    mixedWord ='' 
                    for i in range(len(word)):
                        letter = word[i]
                        if level == 'j�3��3QF' or level == 'j3��qBEF':
                            letter = self.__rot13(letter)
                        mixedWord = mixedWord + self.__GetMixKr(letter)
                    line = string.replace(line,word,mixedWord,1)
            self.__mixedText = self.__mixedText + [line]
        return self.__mixedText

    def __GetMixKr(self,Kr):
        KrChange=Kr
        for i in range(len(self.__mixTable)):
            if self.__mixTable[i][0] == string.lower(Kr):
                random.shuffle(self.__mixTable[i][1])
                KrChange = self.__mixTable[i][1][0]
        return KrChange

    def __rot13(self,Kr):
        rotKr=Kr
        if (109 < ord(Kr) and ord(Kr) < 123) or (77 < ord(Kr) and ord(Kr) < 91):
            rotKr = chr(ord(Kr)-13)
        if (96 < ord(Kr) and ord(Kr) < 110) or (64 < ord(Kr) and ord(Kr) < 78):
            rotKr = chr(ord(Kr)+13)
        return rotKr
        
    def __LoadMixTable(self,level):
        for letter in 'a��bc�de����fghi��jklmno��pqrstu���vwxyz':
            self.__mixTable = self.__mixTable + [[letter,[string.lower(letter), string.upper(letter)]]]
        self.__ChangeKrAccentues()
        if level=='CoWb0yZ':
            self.__AddCowboyzKr()
        elif level=='WaR��R�Z' \
        or level == 'WD�L��rz' \
        or level == 'j�3��3QF' \
        or level == 'j3��qBEF':
            self.__AddCowboyzKr()
            self.__AddWarLordzKr()

    def __ChangeKrMixTable(self,Kr,KrChange,place):
        for i in range(len(self.__mixTable)):
            if self.__mixTable[i][0] == Kr:
                self.__mixTable[i][1][place]=KrChange

    def __AddKrMixTable(self,Kr,KrAdd):
        for i in range(len(self.__mixTable)):
            if self.__mixTable[i][0] == Kr:
                self.__mixTable[i][1]=self.__mixTable[i][1]+[KrAdd]

    def __AddCowboyzKr(self):
        self.__AddKrMixTable('a','4')
        self.__AddKrMixTable('�','4')
        self.__AddKrMixTable('�','4')
        self.__AddKrMixTable('b','6')
        self.__AddKrMixTable('e','3')
        self.__AddKrMixTable('�','3')
        self.__AddKrMixTable('�','3')
        self.__AddKrMixTable('�','3')
        self.__AddKrMixTable('�','3')
        self.__AddKrMixTable('g','9')
        self.__AddKrMixTable('i','1')
        self.__AddKrMixTable('�','1')
        self.__AddKrMixTable('�','1')
        self.__AddKrMixTable('o','0')
        self.__AddKrMixTable('�','0')
        self.__AddKrMixTable('�','0')
        self.__AddKrMixTable('s','5')
        self.__AddKrMixTable('s','z')
        self.__AddKrMixTable('s','Z')

    def __AddWarLordzKr(self):
        self.__AddKrMixTable('a','@')
        self.__AddKrMixTable('a','�')
        self.__AddKrMixTable('a','�')
        self.__AddKrMixTable('a','�')
        self.__AddKrMixTable('a','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('b','�')
        self.__AddKrMixTable('c','�')
        self.__AddKrMixTable('c','�')
        self.__AddKrMixTable('c','(')
        self.__AddKrMixTable('d','�')
        self.__AddKrMixTable('d','�')
        self.__AddKrMixTable('i',';')
        self.__AddKrMixTable('i','|')
        self.__AddKrMixTable('�','|')
        self.__AddKrMixTable('�','|')
        self.__AddKrMixTable('i','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('l','�')
        self.__AddKrMixTable('n','�')
        self.__AddKrMixTable('n','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('�','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('o','�')
        self.__AddKrMixTable('q','�')
        self.__AddKrMixTable('r','�')
        self.__AddKrMixTable('s','�')
        self.__AddKrMixTable('u','�')
        self.__AddKrMixTable('t','+')
        self.__AddKrMixTable('x','�')
        self.__AddKrMixTable('y','�')
        self.__AddKrMixTable('y','�')
        self.__AddKrMixTable('y','�')
        self.__AddKrMixTable('s','$')

    def __ChangeKrAccentues(self):
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)
        self.__ChangeKrMixTable('�','�',1)

    def __megaSplit(self,myString):
        myString = string.replace(myString,'_',' ')
        myString = re.compile("[^\w�������������]").split(myString)
        return myString

