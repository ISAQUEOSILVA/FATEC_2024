//Bibliotecas
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'
#include "TBIConn.CH"
#include "totvs.ch"
#Include "TopConn.ch"
#include 'parmtype.ch'
#INCLUDE "RWMAKE.CH"
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RTG001  ºAutor  ³Isaque O Silva        º Data ³  27/05/24   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Ponto de entrada para enviar e-mail automático do pedido de º±±
±±º          ³compra ou autorização de entrega                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³Adezan                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RTG001()
Local _aArea    := GetArea() 
Local oBrowse
Private _cTitulo  :='Biblioteca de Customizações'
Private _aRotina :={}

// Instanciamento da Classe de Browse
oBrowse := FWMBrowse():New()

// Definição da tabela do Browse
oBrowse:SetAlias('Z04')

// Definição da legenda 1
oBrowse:AddLegend( "Empty(Z04_DEFINE)", "GREEN",    "Pendende Definicao",   '1' )
oBrowse:AddLegend( "!Empty(Z04_DEFINE)","RED" ,     "Definido",             '1' )

// Definição da legenda 2
//oBrowse:AddLegend( "Z04_TIPO =='SX1'", "YELLOW", "Perguntas" )
oBrowse:AddLegend( "Z04_TIPO =='SX2'",  "ORANGE",   "Tabelas",              '2' )
oBrowse:AddLegend( "Z04_TIPO =='SX3'",  "BLUE",     "Campos",               '2' )
oBrowse:AddLegend( "Z04_TIPO =='SIX'",  "WHITE",    "Indice",               '2' )
//oBrowse:AddLegend( "Z04_TIPO =='SX5'", "GRAY", "Tabelas Genericas" )
oBrowse:AddLegend( "Z04_TIPO =='SX6'",  "BROWN",    "Parametros",           '2' )
oBrowse:AddLegend( "Z04_TIPO =='SX7'",  "BLACK",    "Gatilhos",             '2' )
//oBrowse:AddLegend( "Z04_TIPO =='SXB'", "PINK", "Consulta Padrão" )
oBrowse:AddLegend( "Z04_TIPO =='RPO'",  "PINK",     "Código fonte",         '2' )


// Titulo da Browse
oBrowse:SetDescription(_cTitulo)

// definicao do menu
_aRotina:=MenuDef()
 
 // DEFINE DE ONDE SERÁ RETIRADO O MENUDEF
   //oBrowse:SetMenuDef("RTG001")
// Ativação da Classe
oBrowse:Activate()

// restaura a Area
RestArea(_aArea)
Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ MenuDef    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Criação Menu MV                                     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

Static Function MenuDef()
Local _aRotina := {}
    
//Adicionando funções no menu
ADD OPTION _aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.RTG001' OPERATION MODEL_OPERATION_VIEW   ACCESS 0 //OPERATION 1
ADD OPTION _aRotina TITLE 'Incluir' ACTION 'VIEWDEF.RTG001' OPERATION MODEL_OPERATION_INSERT   ACCESS 0 //OPERATION 1
ADD OPTION _aRotina TITLE 'Buscar'    ACTION 'U_RTG002'     OPERATION 6                      ACCESS 0 //OPERATION X
ADD OPTION _aRotina TITLE 'Definir Status'    ACTION 'U_RTG003'     OPERATION 6                      ACCESS 0 //OPERATION X
ADD OPTION _aRotina TITLE 'Descrever Finalidade'    ACTION 'U_RTG004'     OPERATION 6                      ACCESS 0 //OPERATION X
ADD OPTION _aRotina TITLE 'Grafico'    ACTION 'u_RTG005'     OPERATION 6                      ACCESS 0 //OPERATION X

 
Return (_aRotina)

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ ModelDef    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Criação modelo de dados                             ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function ModelDef()
Local oStruZ04 := FWFormStruct(1, "Z04")
Local oModel // Modelo de dados que será construído

//Cria o modelo de dados para cadastro
oModel := MPFormModel():New("RTG001M")
// Cria componentes
oModel:AddFields("Z04MASTER",, oStruZ04)
// descrição dos modelo de dados
oModel:SetDescription("Modelo de dados - " + _cTitulo)
// descrição dos componentes
oModel:GetModel("Z04MASTER"):SetDescription( "Dados de - " + _cTitulo)

oModel:SetPrimaryKey({})
Return oModel

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ ViewDef    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ visualização de dados                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

Static Function ViewDef()

// Cria um objeto de Modelo de dados baseado no ModelDef() do fonte informado
//Local oModel := FWLoadModel( "RTG001" )
Local oModel := ModelDef()

// Cria a estrutura a ser usada na View
Local oStruZ04 := FWFormStruct( 2, 'Z04' )

// Interface de visualização construída
Local oView 

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado na View
oView:SetModel( oModel )

// Adiciona no nosso View um controle do tipo formulário 
oView:AddField( 'VIEW_Z04', oStruZ04, 'Z04MASTER' )

// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'TELA' , 100 )

// Relaciona o identificador (ID) da View com o "box" para exibição
oView:SetOwnerView( 'VIEW_Z04', 'TELA' )
// Retorna o objeto de View criado
Return oView

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ RTG002    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Atualiza as customizações existentes no sistema     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
User Function RTG002()

// usar regua na interface
Processa({|| GRVDADOS()}, "Filtrando...")

Return

/*-----------------------------------------------------------*
 | Func.: GRVDADOS                                          |
 | Desc.: BUSCA AS CUSTOMIZAÇÕES E GRAVA                    |
 *-----------------------------------------------------------*/
  
Static Function GRVDADOS()
Local _cQry     :=''
Local cAliasTG	:=GetNextAlias()
Local cAliasRP	:=GetNextAlias()
Local _cCod     :=GetSxeNum("Z04","Z04_COD")
Local aFontes   := {}
Local aFontesQ  := {}
Local nTfontes  :=0
Local nI        :=0
Local nPOs      :=0
Local nTotal    := 0
Local nAtu      := 0
Local _nSX      :=0

//verifico se é o administrador
If __cUserId='000000'
    // Crio uma Query com o select
    _cQry :=" SELECT Z04_COD CODIGO,  "+STR_PULA
    _cQry +="        TIPO,  "+STR_PULA
    _cQry +="        DESCTP,  "+STR_PULA
    _cQry +="        ENTIDADE,  "+STR_PULA
    _cQry +="        DESCENT  "+STR_PULA
    _cQry +=" FROM  "+STR_PULA
    _cQry +="   (SELECT 'SX3' TIPO,  "+STR_PULA
    _cQry +="                 'CAMPOS' DESCTP,  "+STR_PULA
    _cQry +="                          X3_CAMPO ENTIDADE, "+STR_PULA
    _cQry +="                          X3_DESCRIC DESCENT "+STR_PULA
    _cQry +="    FROM SX3000 "+STR_PULA
    _cQry +="    WHERE X3_PROPRI ='U' "+STR_PULA
    _cQry +="      AND D_E_L_E_T_='' "+STR_PULA
    _cQry +="    UNION ALL SELECT 'SX2', "+STR_PULA
    _cQry +="                     'TABELAS', "+STR_PULA
    _cQry +="                     X2_CHAVE, "+STR_PULA
    _cQry +="                     X2_NOME "+STR_PULA
    _cQry +="    FROM SX2000 "+STR_PULA
    _cQry +="    WHERE X2_PYME='' "+STR_PULA
    _cQry +="      AND D_E_L_E_T_='' "+STR_PULA
    _cQry +="    UNION ALL SELECT 'SIX', "+STR_PULA
    _cQry +="                     'INDICE', "+STR_PULA
    _cQry +="                     INDICE+'_'+ORDEM, "+STR_PULA
    _cQry +="                     DESCRICAO "+STR_PULA
    _cQry +="    FROM SIX000 "+STR_PULA
    _cQry +="    WHERE PROPRI='U' "+STR_PULA
    _cQry +="      AND D_E_L_E_T_='' "+STR_PULA
    _cQry +="    UNION ALL SELECT DISTINCT 'SX6', "+STR_PULA
    _cQry +="                              'PARAMETROS', "+STR_PULA
    _cQry +="                              X6_VAR, "+STR_PULA
    _cQry +="                              X6_DESCRIC "+STR_PULA
    _cQry +="    FROM SX6000 "+STR_PULA
    _cQry +="    WHERE X6_PROPRI='U' "+STR_PULA
    _cQry +="      AND D_E_L_E_T_='' "+STR_PULA
    _cQry +="    UNION ALL SELECT 'SX7', "+STR_PULA
    _cQry +="                     'GATILHOS', "+STR_PULA
    _cQry +="                     X7_CAMPO+'_'+X7_SEQUENC, "+STR_PULA
    _cQry +="                     TRIM(X7_REGRA)+' -> '+X7_CDOMIN "+STR_PULA
    _cQry +="    FROM SX7000 "+STR_PULA
    _cQry +="    WHERE X7_PROPRI='U' "+STR_PULA
    _cQry +="     AND D_E_L_E_T_='') AS SX "+STR_PULA
    _cQry +=" LEFT JOIN Z04000 Z ON Z04_TIPO = TIPO "+STR_PULA
    _cQry +=" AND Z04_ENTIDA = ENTIDADE "+STR_PULA
    _cQry +=" AND Z.D_E_L_E_T_='' "+STR_PULA
    _cQry +=" WHERE Z04_COD IS NULL "+STR_PULA
    _cQry +=" ORDER BY TIPO, "+STR_PULA
    _cQry +="          ENTIDADE "+STR_PULA

    // crio a tabela temporaria
    TcQuery _cQry New Alias (cAliasTG)

    //Contagem dos registros
    Count To nTotal
    ProcRegua(nTotal)
   
    _nSX :=nTotal
    // abro a tabela temporaria
    dbSelectArea(cAliasTG)
    (cAliasTG)->(DbGoTop())
    while (cAliasTG)->(!Eof())
            // Grava registro na tabela
            dbSelectArea('Z04')
            If Reclock("Z04",.T.)
                    Z04->Z04_COD     := _cCod
                    Z04->Z04_TIPO    := alltrim((cAliasTG)->TIPO)
                    Z04->Z04_DESCTP  := alltrim((cAliasTG)->DESCTP)
                    Z04->Z04_ENTIDA  := alltrim((cAliasTG)->ENTIDADE)
                    Z04->Z04_DESCEN  := alltrim((cAliasTG)->DESCENT)
                    Z04->Z04_MSBLQL  :='2'
                ConfirmSx8()
                Msunlock()	
                _cCod     :=GetSxeNum("Z04","Z04_COD")
                
                //Incrementa a mensagem na régua
                nAtu++
                IncProc("Analisando registro " + cValToChar(nAtu) + " de " + cValToChar(nTotal) + "...")
            
            else
                RollbackSx8()
            EndIF
        (cAliasTG)->(DbSkip())
    EndDo

    //busca código fonte no repositorio
    aFontes := GetSrcArray("*.PRW", 3)

    // ordena array
    aSort(aFontes)

    // consulta fontes já cadastrados
    _cQry :=" SELECT Z04_COD CODIGO, "+STR_PULA
    _cQry +="        Z04_TIPO TIPO, "+STR_PULA
    _cQry +="        Z04_ENTIDA ENTIDADE "+STR_PULA
    _cQry +=" FROM Z04000 "+STR_PULA
    _cQry +=" WHERE Z04_TIPO ='RPO' "+STR_PULA
    _cQry +=" ORDER BY Z04_ENTIDA "+STR_PULA

    // crio a tabela temporaria
    TcQuery _cQry New Alias (cAliasRP)

    //Contagem dos registros
    Count To nTotal
    ProcRegua(nTotal)
    nAtu:=0

    // abro a tabela temporaria
    dbSelectArea(cAliasRP)
    (cAliasRP)->(DbGoTop())
    while (cAliasRP)->(!Eof())
        //adiciona fontes encontrados no array
        aAdd(aFontesQ,(cAliasRP)->ENTIDADE)
        (cAliasRP)->(DbSkip())
    EndDo
  
    nTfontes := len(aFontesQ)
    
    /// inicio a analise se os fontes j´s estao na base
    If len(aFontesQ) > 0
        For nI := 1 to Len(aFontes)
            nPos := aScan(aFontesQ, {|x| AllTrim(Upper(x)) == alltrim(UPPER(aFontes[nI]))})
            If nPos == 0
                /// gravo na tabela os fontes encontrados    
                dbSelectArea ('Z04')
                If Reclock("Z04",.T.)
                        Z04->Z04_COD     := _cCod
                        Z04->Z04_TIPO    := "RPO"
                        Z04->Z04_DESCTP  := "CODIGO FONTE"
                        Z04->Z04_ENTIDA  := alltrim(UPPER(aFontes[nI]))
                        Z04->Z04_DESCEN  := alltrim(UPPER(aFontes[nI]))
                        Z04->Z04_MSBLQL  :='2'
                    ConfirmSx8()
                    Msunlock()	
                    _cCod     :=GetSxeNum("Z04","Z04_COD")
                    nAtu++
                    IncProc("Analisando registro " + cValToChar(nAtu) + " de " + cValToChar(nTfontes) + "...")
                else
                    RollbackSx8()
                EndIF
            EndIF
            nPOs:=0
        next nI
    Else /// é primeira importação grava todos os fontes
        For nI := 1 to Len(aFontes)
            dbSelectArea ('Z04')
            If Reclock("Z04",.T.)
                    Z04->Z04_COD     := _cCod
                    Z04->Z04_TIPO    := "RPO"
                    Z04->Z04_DESCTP  := "CODIGO FONTE"
                    Z04->Z04_ENTIDA  := alltrim(UPPER(aFontes[nI]))
                    Z04->Z04_DESCEN  := alltrim(UPPER(aFontes[nI]))
                    Z04->Z04_MSBLQL  :='2'
                ConfirmSx8()
                Msunlock()	
                _cCod     :=GetSxeNum("Z04","Z04_COD")
                nAtu++
                IncProc("Analisando registro " + cValToChar(nAtu) + " de " + cValToChar(nTfontes) + "...")
            else
                RollbackSx8()
            EndIF
        next nI
    EndIF
Else
       FWAlertWarning("Somente o usuário administrador gerar base de dados das customizações","Base de dados")
EndIF

/// informo a quantidade de fontes gravadas
IF nAtu > 0 .or. _nSX > 0
    nTfontes:= nAtu+_nSx
    FWAlertSuccess("Foram gravadas: "+cValToChar(nTfontes)+" novos registros na Biblioteca de Customizações", "Gerar Base de dados das Customizações")

Else

    FWAlertWarning("Não existe novas customizações no sistema", "Gerar Base de dados das Customizações")

EndIF

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ RTG003    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Atualiza status  das customizações  no sistema     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function RTG003()
Local _cStatus:= ''

// verifico se está avivo
If Z04->Z04_MSBLQL =='2'
    _cStatus:= "Ativo"
Else
     _cStatus:= "Obsoleto"
EndIF

// verifico se é o administrador
If __cUserId='000000'
    //// verifico o status da customização para gerar mensagem correta    
    If Z04->Z04_MSBLQL =='2'
        _cStatus:= "ativa"
        _cMotivo:=ApMsgYesNO("A customização selecionada está "+_cStatus+STR_PULA+" Deseja definir o status como obsoleta?","Definição Status")
        dbSelectArea('Z04')
        If Reclock("Z04",.F.)
                Z04->Z04_MSBLQL  :='1'
            Msunlock()	
            FWAlertSuccess("Status alterado com sucesso", "Definição Status")
        Else
            FWAlertError("Status não foi alterado, tente novamente", "Definição Status")
        EndIF

    Else
        _cStatus:= "obsoleta"
         _cMotivo:=ApMsgYesNO("A customização selecionada está "+_cStatus+STR_PULA+" Desejadefinir o status como ativa?","Definição Status")
            dbSelectArea('Z04')
        If Reclock("Z04",.F.)
                Z04->Z04_MSBLQL  :='2'
            Msunlock()	
            FWAlertSuccess("Status alterado com sucesso", "Definição Status")
        Else
            FWAlertError("Status não foi alterado, tente novamente", "Definição Status")
        EndIF

    EndIF   

Else
    FWAlertWarning("Somente o usuário administrador pode alterar o status da customização","Definição Status")
EndIF

Return


/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ RTG004    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ permite descreve a finalidade da customizaçõe       ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function RTG004()
Local _cDescr  := ''
Local lGrava   := .F.
Private _oDlg			

/// verifico o status da customização
If Z04->Z04_MSBLQL =='2'
    _cStatus:= "Ativo"
Else
     _cStatus:= "Obsoleto"
EndIF

/// verifico se é o administador
If __cUserId='000000'
    If Z04->Z04_MSBLQL =='2'
        /// pego a definição anterior
        _cDescr:=Z04->Z04_DEFINE
        
        /// crio a tela de digitação
        DEFINE MSDIALOG _oDlg TITLE OemtoAnsi("Descreva a finalidade dessa customização") FROM 000,000 TO 230,520 COLOR 0, 16777215 PIXEL

         oTMultiget1 := tMultiget():new( 01, 01, {| u | if( pCount() > 0, _cDescr := u, _cDescr ) }, _oDlg, 260, 92, , , , , , .T. )
	    // Cria botão
	    @ 97,120 Button OemtoAnsi("Confirma") Size 037,012 PIXEL  ACTION (lGrava := .T.,_oDlg:End())

        ACTIVATE MSDIALOG _oDlg CENTERED 

        If lGrava
            // gravo a definição e retorno se gravou
            dbSelectArea('Z04')
            If Reclock("Z04",.F.)
                    Z04->Z04_DEFINE  :=_cDescr
                    Z04->Z04_USER := cUsername+" em "+ dtoc(dDATABASE)
                Msunlock()	
                FWAlertSuccess("Descrição da finalidade gravada com sucesso!", "Descrever Finalidade")
            Else
                FWAlertError("Não foi possivel gravar a descrição da finalidade,"+_cStatus+STR_PULA+"tenta novamente", "Descrever Finalidade")
            EndIF
        EndIF
    Else
        _cStatus:= "obsoleta"

        FWAlertError("A customização selecionada está "+_cStatus+STR_PULA+" não é possivel descrever uma finalidade!"+_cStatus+STR_PULA+"Defina o status como ativa e tente novamente", "Descrever Finalidade")

    EndIF   

Else
    FWAlertWarning("Somente o usuário administrador pode descrever a finalidade da customização","Descrever Finalidade")
EndIF

Return


/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Função    ³ RTG005    ³Autor ³ Isaque O Silva  ³Data³ 28/05/24 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Atualiza as customizações existentes no sistema     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function RTG005()
Local _cTitle :='Estatística das Customizações'
Local _cSTitle:='Customizações Ativas/Obsoletas'
Local cQuery :=''
Private cAliasGF	:=GetNextAlias()

////crio a tela
oDlg := FwDialogModal():New()
oDlg:SetTitle(_cTitle)
oDlg:SetSubTitle(_cSTitle)	
oDlg:SetSize(400,650)
	
oDlg:CreateDialog()

// crio os layer	
oPanelModal	:= oDlg:GetPanelMain()
oLayer := FwLayer():New()
oLayer:Init(oPanelModal)
// defino as telas na horizontal
oLayer:AddCollumn('col01', 100, .T.)

/// defino as telas na vertical
oLayer:AddWindow('col01', 'win01', 'Dados'	, 40)
oPanel01 := oLayer:getWinPanel('col01', 'win01')

oLayer:AddWindow('col01', 'win02', 'Gráfico', 60)
oPanel02 := oLayer:getWinPanel('col01', 'win02')

// crio o browser na segunda tela
oBrowse := FwBrowse():New(oPanel01)

oBrowse:disableReport()
oBrowse:disableConfig()	

//crio o grafico
oChart:= FwChartFactory():New()
oChart:SetOwner(oPanel02)
oChart:SetLegend(CONTROL_ALIGN_LEFT)

/// alinho o titulo
oChart:setTitle(_cTitle, CONTROL_ALIGN_CENTER) 

/// crio a descrição
oChart:SetXAxis( {"Quantidade", "Ativo", "Inativo"} )

/// defino a forma dos dados
oChart:setPicture("@E 999,999,999.99")

///monto a query

cQuery := "SELECT Z04_TIPO, Z04_DESCTP, "
cQuery += "       COUNT(Z04_COD) QUANTIDADE, "
cQuery += "       COUNT((CASE "
cQuery += "                WHEN Z04_MSBLQL = '2' THEN Z04_COD "
cQuery += "              END)) ATIVO, "
cQuery += "       COUNT((CASE "
cQuery += "                  WHEN Z04_MSBLQL = '1' THEN Z04_COD "
cQuery += "              END)) INATIVO "
cQuery += "FROM Z04000 "
cQuery += "WHERE D_E_L_E_T_='' "
cQuery += "GROUP BY Z04_TIPO,Z04_DESCTP "

TcQuery cQuery New Alias _Query 
_Query->(dbGoTop())

/// populo as series do grafico
If _Query->(!EOF())
    While _Query->(!EOF())
            oChart:addSerie( alltrim(_Query->Z04_DESCTP)+"-"+ cvaltochar(_Query->QUANTIDADE)  , { _Query->QUANTIDADE , _Query->ATIVO,_Query->INATIVO    } )
        _Query->(dbSkip())
    EndDo
Endif

//Defino o tipo do grafico
oChart:SetChartDefault(NEWPIECHART)

/// crio o grafico
oChart:Activate()

/// preenche 
oBrowse:SetDataQuery(.T.)
oBrowse:SetAlias(('Query'))
oBrowse:SetQuery(cQuery)

// monto as colunas
oColumn := FwBrwColumn():New()
oColumn:SetData({|| Query->Z04_DESCTP })
oColumn:SetTitle('Tipo')
oColumn:SetSize(25)
oBrowse:SetColumns({oColumn})


oColumn := FwBrwColumn():New()
oColumn:SetData({|| Query->QUANTIDADE })
oColumn:SetTitle('Total')
oColumn:SetSize(14)
oColumn:SetAlign(2)

oColumn:SetPicture('@e 999,999,999')
oBrowse:SetColumns({oColumn})	
    
oColumn := FwBrwColumn():New()
oColumn:SetData({|| Query->ATIVO })
oColumn:SetTitle('T. Ativo')
oColumn:SetSize(14)
oColumn:SetAlign(2)

oColumn:SetPicture('@e 999,999,999')
oBrowse:SetColumns({oColumn})	
        
oColumn := FwBrwColumn():New()
oColumn:SetData({|| Query->Inativo })
oColumn:SetTitle('T. Obsoleta')
oColumn:SetSize(14)
oColumn:SetAlign(2)

oColumn:SetPicture('@e 999,999,999')
oBrowse:SetColumns({oColumn})	       

oBrowse:Activate()

// fecho a tabela temporaria
_Query->(dbCloseArea())

oDlg:Activate()	


Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  RTG006 ºAutor  ³Isaque O. da Silva º Data   ³  10/6/24   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏ0ÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³rotina para enviar e-mail automático das customizações      º±±
±±º          ³pendentes definir finalidade                                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³FATEC                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTG006()
Local _cAlias1:= GetNextAlias()
Local aItens		:= {}
Local _cHtm			:= ""
Local cError		:= ""
Local cFrom     	
Local cServer		
Local cAccount		
Local cPassword	    
Local cMailSend	   
Local lAuth			
Local lHtm 			:= .F.
Local cQuery        :=''
Local _nCount       :=0
Local _nS           :=0
Default lSched      := .F.

RpcSetType(3)
RPCSetEnv('00','01')
cFrom     := AllTrim(GetNewPar("MV_RELFROM" ," "))//"protheus@adezan.com.br"
cServer	  := AllTrim(GetNewPar("MV_RELSERV"," "))
cAccount  := AllTrim(GetNewPar("MV_RELACNT"," "))
cPassword := AllTrim(GetNewPar("MV_RELPSW" ," "))
cMailSend := "isaque.silva10@fatec.sp.gov.br"
lAuth	  := GetMv("MV_RELAUTH",,.F.)

cQuery := "SELECT Z04_TIPO, Z04_DESCTP, "
cQuery += "       COUNT(Z04_COD) QUANTIDADE "
cQuery += "FROM Z04000 "
cQuery += "WHERE D_E_L_E_T_='' "
cQuery += "AND ISNULL(CAST(CAST(Z04_DEFINE AS VARBINARY(8000)) AS VARCHAR(8000)),'') ='' "
cQuery += "GROUP BY Z04_TIPO,Z04_DESCTP "

//Cria tabela temporária com base no resultado da query 7
dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),_cAlias1,.T.,.F.)
Count To _nCount

If _nCount > 0
    
    lHtm:=.T.

    dbSelectArea(_cAlias1)
	(_cAlias1)->(dBGotop())
    While (_cAlias1)->(!EOF())
        
        // preencho array com informações que deverão ser impressas no cabeçalho do relatório
        AAdd(aItens,{(_cAlias1)->Z04_DESCTP,(_cAlias1)->QUANTIDADE })

        (_cAlias1)->(dbSkip())

    EndDo
    (_cAlias1)->(dbCloseArea())
EndIf

IF !empty(aItens)
_cHtm :='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
_cHtm +='<html>'
_cHtm +='<head>'
_cHtm +='	<title>Lista de customizações pendentes descrever finalidade</title>'
_cHtm +='	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">'
_cHtm +='	<style >'
_cHtm += '   .alinhaEsquerda { text-align: left !important; align: center;}'
_cHtm += '	.alinhaCentro { text-align: center !important; align: center;}'
_cHtm += '	.alinhaDireita { text-align: right !important; align: center;}'
_cHtm += '	body { max-width: 800px; margin: 0 auto; font-family: tahoma; font-size: 12px;}'
_cHtm += '	tbody { font-size: 14px; } '
_cHtm += '	table { margin-bottom: 10px; border: 1px solid black; width:100%;}'
_cHtm += '	thead tr th { color: #fff; background:#317a6f; font-weight: normal; font-size: 14px; }'
_cHtm += '	td#dif {color: #FFF; background:#317a6f;}	'
_cHtm += '	tr#l1 {background:#F2F2F2;}	'
_cHtm += '	tr#l2 {background:#D8D8D8;}	'
_cHtm += '	td { padding: 5px; }'
_cHtm += '	table.cabec {  border-spacing: 2; }'
_cHtm += '	table.itens {  border-spacing: 2; }'
_cHtm += '	table.itens tbody tr td { border:0; border-top: 1px solid black; font-size: 12px; }'
_cHtm += '	table.itens tbody tr#dif { color: #FFF; background:#000; }'
_cHtm += '	table.itens tbody tr:nth-child(even) { background-color: #eee; }'
_cHtm += '	h3 { margin-bottom: 5px; font-weight: normal; }'
_cHtm +='	</style>'
_cHtm +='</head>'
_cHtm +='<body>'
_cHtm +='	<div>'
_cHtm +='		<h3>Sr. Adminsitrador, segue customizações que estão pendentes descrever suas finalidades</h3>'
_cHtm +='		<h3>Emissão: <strong>'+DTOC( ddatabase )+'</strong></h3>'
_cHtm +='	</div>'
_cHtm +='    <table class="itens">'
_cHtm +='        <thead>'
_cHtm +='        	<tr>'
_cHtm +='            	<th colspan="8">Customizações</th>'
_cHtm +='        	</tr>'
_cHtm +='           <tr>'
_cHtm +='              <th>Tipo da Customização</th>'
_cHtm +='              <th>Quantidade pendente</th>'
_cHtm +='           </tr>'
_cHtm +='        </thead>'
_cHtm +='        <tbody class="itens">'
For _nS:=1 to len (aItens)
	If _nS % 2 == 0
		_cLinha := "l2"
	Else
		_cLinha := "l1"
	EndIf
	_cHtm +='            <tr id="'+_cLinha+'">'
	_cHtm +='                <td>'+ aItens[_nS,01] +'</td>'
	_cHtm +='                <td>'+ cvaltochar(aItens[_nS,02]) +'</td>'
	_cHtm +='            </tr>'
Next _nS
_cHtm +='        </tbody>'
_cHtm +='    </table>'
_cHtm +='    <br/>'
_cHtm +='</body>'
_cHtm +=''
_cHtm +='</html>'


EndIF

If lHtm         
	////////////////////////////////////////
	//Chamda da rotina para envio de email//
	////////////////////////////////////////


	CONNECT SMTP SERVER cServer ACCOUNT cAccount PASSWORD cPassword Result lOk
	
	If lOk
		If lAuth//Verifica se servidor necessita autenticacao
			lOk := MailAuth(cAccount,cPassword)
			
			If !lOk

				ConOut("Verifique as configurações de autenticação da conta do e-mail")
                GET MAIL ERROR cError
				ConOut("Erro no envio: " +cError)
			EndIf
		EndIf		

		If lOk
			SEND MAIL FROM cFrom TO cMailSend SUBJECT "Customizações pendente descrever finalidade " BODY _cHtm  Result lOk

			If !lOk
				ConOut("E-Mail não enviado devido a problema de conexão. ROTINA RGPER001.")
				
				GET MAIL ERROR cError
				ConOut("Falha na conexão " + cError)

			Else
				ConOut("E-Mail enviado com sucesso")	
				//MSGALERT("Envio por email com sucesso!","Relatório Segunda Férias" )
			EndIf
		EndIf
	Else

		ConOut("Problemas de conexão. Verifique com o administrador")

	EndIf
	
	DISCONNECT SMTP SERVER Result lOk

EndIf
RpcClearEnv()

Return
