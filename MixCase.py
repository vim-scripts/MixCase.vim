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
        if level=='5' or level == 'j3¥ñqBEF':
            level = 'j3¥ñqBEF'
            self.__rangeLines = self.MixCambridge()
            self.__mixedText = []
        elif level=='4' or level == 'jÑ3ÿß3QF':
            level = 'jÑ3ÿß3QF'
        elif level=='3' or level == 'WD®LãØrz':
            level = 'WD®LãØrz'
            self.__rangeLines = self.MixCambridge()
            self.__mixedText = []
        elif level=='2' or level == 'WaR£ØRðZ':
            level = 'WaR£ØRðZ'
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
                        if level == 'jÑ3ÿß3QF' or level == 'j3¥ñqBEF':
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
        for letter in 'aàâbcçdeéèêëfghiîïjklmnoôöpqrstuùüûvwxyz':
            self.__mixTable = self.__mixTable + [[letter,[string.lower(letter), string.upper(letter)]]]
        self.__ChangeKrAccentues()
        if level=='CoWb0yZ':
            self.__AddCowboyzKr()
        elif level=='WaR£ØRðZ' \
        or level == 'WD®LãØrz' \
        or level == 'jÑ3ÿß3QF' \
        or level == 'j3¥ñqBEF':
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
        self.__AddKrMixTable('à','4')
        self.__AddKrMixTable('â','4')
        self.__AddKrMixTable('b','6')
        self.__AddKrMixTable('e','3')
        self.__AddKrMixTable('é','3')
        self.__AddKrMixTable('è','3')
        self.__AddKrMixTable('ê','3')
        self.__AddKrMixTable('ë','3')
        self.__AddKrMixTable('g','9')
        self.__AddKrMixTable('i','1')
        self.__AddKrMixTable('î','1')
        self.__AddKrMixTable('ï','1')
        self.__AddKrMixTable('o','0')
        self.__AddKrMixTable('ô','0')
        self.__AddKrMixTable('ö','0')
        self.__AddKrMixTable('s','5')
        self.__AddKrMixTable('s','z')
        self.__AddKrMixTable('s','Z')

    def __AddWarLordzKr(self):
        self.__AddKrMixTable('a','@')
        self.__AddKrMixTable('a','Å')
        self.__AddKrMixTable('a','å')
        self.__AddKrMixTable('a','ã')
        self.__AddKrMixTable('a','ª')
        self.__AddKrMixTable('à','ª')
        self.__AddKrMixTable('â','ª')
        self.__AddKrMixTable('b','ß')
        self.__AddKrMixTable('c','©')
        self.__AddKrMixTable('c','¢')
        self.__AddKrMixTable('c','(')
        self.__AddKrMixTable('d','Ð')
        self.__AddKrMixTable('d','ð')
        self.__AddKrMixTable('i',';')
        self.__AddKrMixTable('i','|')
        self.__AddKrMixTable('î','|')
        self.__AddKrMixTable('ï','|')
        self.__AddKrMixTable('i','¡')
        self.__AddKrMixTable('î','¡')
        self.__AddKrMixTable('ï','¡')
        self.__AddKrMixTable('l','£')
        self.__AddKrMixTable('n','Ñ')
        self.__AddKrMixTable('n','ñ')
        self.__AddKrMixTable('o','¤')
        self.__AddKrMixTable('ô','¤')
        self.__AddKrMixTable('ö','¤')
        self.__AddKrMixTable('o','º')
        self.__AddKrMixTable('ô','º')
        self.__AddKrMixTable('ö','º')
        self.__AddKrMixTable('o','Õ')
        self.__AddKrMixTable('o','õ')
        self.__AddKrMixTable('o','Ø')
        self.__AddKrMixTable('o','ø')
        self.__AddKrMixTable('q','¶')
        self.__AddKrMixTable('r','®')
        self.__AddKrMixTable('s','§')
        self.__AddKrMixTable('u','µ')
        self.__AddKrMixTable('t','+')
        self.__AddKrMixTable('x','×')
        self.__AddKrMixTable('y','¥')
        self.__AddKrMixTable('y','ý')
        self.__AddKrMixTable('y','ÿ')
        self.__AddKrMixTable('s','$')

    def __ChangeKrAccentues(self):
        self.__ChangeKrMixTable('à','À',1)
        self.__ChangeKrMixTable('â','Â',1)
        self.__ChangeKrMixTable('é','É',1)
        self.__ChangeKrMixTable('è','È',1)
        self.__ChangeKrMixTable('ê','Ê',1)
        self.__ChangeKrMixTable('ë','Ë',1)
        self.__ChangeKrMixTable('î','Î',1)
        self.__ChangeKrMixTable('ï','Ï',1)
        self.__ChangeKrMixTable('ô','Ô',1)
        self.__ChangeKrMixTable('ö','Ö',1)
        self.__ChangeKrMixTable('ù','Ù',1)
        self.__ChangeKrMixTable('û','Û',1)
        self.__ChangeKrMixTable('ü','Ü',1)

    def __megaSplit(self,myString):
        myString = string.replace(myString,'_',' ')
        myString = re.compile("[^\wàâéèêëîïôöùûü]").split(myString)
        return myString

