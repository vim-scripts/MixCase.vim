import string, re, random
class MixCase:
    __rangeLines = []
    __mixedText = []
    __mixTable=[]

    def __init__(self, curRange, iniFile):
        for line in curRange:
            self.__rangeLines = self.__rangeLines + [line]
        self.__mixedText = []
        self.__Params = {'mode':'add','case':'ic','letterSep':' ','groupSep':';'}
        self.__RookieMixTable = {}
        self.__CowBoyzMixTable = {}
        self.__WarLordsMixTable = {}
        self.__LoadMixTables(iniFile)
        self.__mixTable={}

    def MixCambridge(self,level='0',printLevel=1):
        """ Mixes center letters of each word of the range

        """
        if level=='0' or level == 'Crgimdbae':
            level='Crgimdbae'
        else:
            level='Cabdgimre'
        if printLevel:
            print level
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
        elif level=='3' or level == 'WD®LãØr$':
            level = 'WD®LãØr$'
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
        for line in self.__rangeLines:
            lstWords = self.__megaSplit(line)
            for word in lstWords:
                if word != '':
                    mixedWord ='' 
                    for i in range(len(word)):
                        letter = word[i]
                        if level == 'jÑ3ÿß3QF' or level == 'j3¥ñqBEF':
                            letter = self.__rot13(letter)
                        mixedWord = mixedWord + self.__GetMixKr(letter, level)
                    line = string.replace(line,word,mixedWord,1)
            self.__mixedText = self.__mixedText + [line]
        return self.__mixedText

    def __GetMixKr(self,Kr,level):
        KrChange=Kr
        if self.__Params["case"] == "ic":
            Kr = string.lower(Kr)

        if level == 'j3¥ñqBEF':
            mixTable = self.__WarLordsMixTable
        elif level == 'jÑ3ÿß3QF':
            mixTable = self.__WarLordsMixTable
        elif level == 'WD®LãØr$':
            mixTable = self.__WarLordsMixTable
        elif level == 'WaR£ØRðZ':
            mixTable = self.__WarLordsMixTable
        elif level == 'CoWb0yZ':
            mixTable = self.__CowBoyzMixTable
        else:
            mixTable = self.__RookieMixTable

        if mixTable.has_key(Kr):
            random.shuffle(mixTable[Kr])
            KrChange = mixTable[Kr][0]
        return KrChange

    def __rot13(self,Kr):
        rotKr=Kr
        if (109 < ord(Kr) and ord(Kr) < 123) or (77 < ord(Kr) and ord(Kr) < 91):
            rotKr = chr(ord(Kr)-13)
        if (96 < ord(Kr) and ord(Kr) < 110) or (64 < ord(Kr) and ord(Kr) < 78):
            rotKr = chr(ord(Kr)+13)
        return rotKr
        
    def __LoadMixTables(self,iniFile):
        f=open(iniFile, 'r')
        curFile = f.readlines()
        f.close()
        for line in curFile:
            noCommentedLine = string.split(line[:-1],"#")[0]
            if noCommentedLine != '':
                splitedLine = string.split(noCommentedLine,":",1)
                if len(splitedLine[0]) > 1:
                    self.__Params[splitedLine[0]] = splitedLine[1]
                else:
                    lettre = splitedLine[0]
                    mixGroups = string.split(splitedLine[1],self.__Params["groupSep"],2)
                    self.__RookieMixTable[lettre] = string.split(mixGroups[0],self.__Params["letterSep"])
                    try:
                        self.__RookieMixTable[lettre].remove('')
                    except:
                        pass
                    if self.__Params["mode"] == "add":
                        self.__CowBoyzMixTable[lettre] = self.__RookieMixTable[lettre] + string.split(mixGroups[1],self.__Params["letterSep"])
                    else:
                        self.__CowBoyzMixTable[lettre] = string.split(mixGroups[1],self.__Params["letterSep"])
                    try:
                        self.__CowBoyzMixTable[lettre].remove('')
                    except:
                        pass
                    if self.__Params["mode"] == "add":
                        self.__WarLordsMixTable[lettre] = self.__CowBoyzMixTable[lettre] + string.split(mixGroups[2],self.__Params["letterSep"])
                    else:
                        self.__WarLordsMixTable[lettre] = string.split(mixGroups[2],self.__Params["letterSep"])
                    try:
                        self.__WarLordsMixTable[lettre].remove('')
                    except:
                        pass

    def __megaSplit(self,myString):
        myString = string.replace(myString,'_',' ')
        myString = re.compile("[^\wàâéèêëîïôöùûü]").split(myString)
        return myString

