local kName         = 'Pawksickles'
local Pawksickles   = {}
local EventMgr      = GetEventManager()

local NORMAL        = [[Pawksickles/fonts/dejavusans.ttf]]
local BOLD          = [[Pawksickles/fonts/dejavusans-bold.ttf]]
local BOLDITALIC    = [[Pawksickles/fonts/dejavusans-boldoblique.ttf]]
local ITALIC        = [[Pawksickles/fonts/dejavusans-oblique.ttf]]
local NUMBER        = [[Pawksickles/fonts/dejavusansmono.ttf]]
local SERIF         = [[Pawksickles/fonts/dejavuserif.ttf]]

local THIN          = 'soft-shadow-thin'
local THICK         = 'soft-shadow-thick'
local SHADOW        = 'shadow'

function Pawksickles:OnLoaded( event, addon )
    if ( addon ~= kName ) then
        return 
    end

    self:SetFont( ZoFontWinH1, BOLD, 22, THICK )
    self:SetFont( ZoFontWinH2, BOLD, 20, THICK )
    self:SetFont( ZoFontWinH3, BOLD, 18, THICK )
    self:SetFont( ZoFontWinH4, BOLD, 16, THICK )
    self:SetFont( ZoFontWinH5, BOLD, 14, THIN )

    self:SetFont( ZoFontWinT1, NORMAL, 12, THIN )

    self:SetFont( ZoFontGame, NORMAL, 12, THIN )
    self:SetFont( ZoFontGameMedium, NORMAL, 12, THIN )
    self:SetFont( ZoFontGameBold, BOLD, 12, THIN )
    self:SetFont( ZoFontGameOutline, BOLD, 12, THIN )
    self:SetFont( ZoFontGameShadow, BOLD, 12, THIN )

    self:SetFont( ZoFontGameSmall, NORMAL, 9, THIN )
    self:SetFont( ZoFontGameLarge, NORMAL, 14, THIN )
    self:SetFont( ZoFontGameLargeBold, BOLD, 14, THICK )
    self:SetFont( ZoFontGameLargeBoldShadow, BOLD, 14, THICK )

    self:SetFont( ZoFontHeader, BOLD, 12, THIN )
    self:SetFont( ZoFontHeader2, BOLD, 14, THIN )
    self:SetFont( ZoFontHeader3, BOLD, 16, THIN )
    self:SetFont( ZoFontHeader4, BOLD, 18, THIN )

    self:SetFont( ZoFontCallout, BOLD, 20, THICK )
    self:SetFont( ZoFontCallout2, BOLD, 22, THICK )
    self:SetFont( ZoFontCallout3, BOLD, 24, THICK )

    self:SetFont( ZoFontEdit, NORMAL, 12, SHADOW )
    self:SetFont( ZoLargeFontEdit, NORMAL, 21, SHADOW )

    self:SetFont( ZoFontChat, NORMAL, 12, THIN )
    self:SetFont( ZoFontEditChat, NORMAL, 14, SHADOW )

    self:SetFont( ZoFontWindowTitle, BOLDITALIC, 24, THICK )
    self:SetFont( ZoFontWindowSubtitle, NORMAL, 14, THICK )

    self:SetFont( ZoFontTooltipTitle, BOLDITALIC, 18 )
    self:SetFont( ZoFontTooltipSubtitle, NORMAL, 14 )

    self:SetFont( ZoFontAnnounce, BOLDITALIC, 22, THICK )
    self:SetFont( ZoFontAnnounceMessage, BOLD, 20, THICK )

    self:SetFont( ZoFontAnnounceSmall, BOLDITALIC, 12, THICK )
    self:SetFont( ZoFontAnnounceMedium, BOLDITALIC, 20, THICK )
    self:SetFont( ZoFontAnnounceLarge, BOLDITALIC, 28, THICK )

    self:SetFont( ZoFontCenterScreenAnnounceLarge, BOLDITALIC, 28, THICK )
    self:SetFont( ZoFontCenterScreenAnnounceSmall, BOLDITALIC, 20, THICK )

    self:SetFont( ZoFontAlert, BOLDITALIC, 18, THICK )

    self:SetFont( ZoFontConversationName, BOLDITALIC, 20, THICK )
    self:SetFont( ZoFontConversationText, NORMAL, 18, THICK )
    self:SetFont( ZoFontConversationOption, ITALIC, 14, THICK )
    self:SetFont( ZoFontConversationQuestReward, NORMAL, 14, THICK )

    self:SetFont( ZoFontKeybindStripKey, BOLD, 14, THIN )
    self:SetFont( ZoFontKeybindStripDescription, BOLD, 14, THICK )

    --self:SetFont( ZoCraftingInstruction, NORMAL, 30, THICK )
    self:SetFont( ZoInteractionPrompt, NORMAL, 16, THIN )

    self:SetFont( ZoFontBookPaper, SERIF, 14 )
    self:SetFont( ZoFontBookSkin, SERIF, 14 )
    self:SetFont( ZoFontBookRubbing, SERIF, 14 )
    self:SetFont( ZoFontBookLetter, SERIF, 14 )
    self:SetFont( ZoFontBookNote, SERIF, 14 )
    self:SetFont( ZoFontBookScroll, SERIF, 14 )
    self:SetFont( ZoFontBookTablet, SERIF, 14 )
    self:SetFont( ZoFontBookPaperTitle, SERIF, 20 )
    self:SetFont( ZoFontBookSkinTitle, SERIF, 20 )
    self:SetFont( ZoFontBookRubbingTitle, SERIF, 20 )
    self:SetFont( ZoFontBookLetterTitle, SERIF, 20 )
    self:SetFont( ZoFontBookNoteTitle, SERIF, 20 )
    self:SetFont( ZoFontBookScrollTitle, SERIF, 20 )
    self:SetFont( ZoFontBookTabletTitle, SERIF, 20 )
        
    self:SetFont( ZoFontBossName, BOLDITALIC, 16, THIN )
    self:SetFont( ZoFontBoss, BOLD, 12, THIN )
end

function Pawksickles:SetFont( object, fontFace, size, decoration )
    local fmt = '%s|%d'
    if ( decoration ) then
        fmt = fmt .. '|%s'
    end

    object:SetFont( string.format( fmt, fontFace, size, decoration ) )
end

EventMgr:RegisterForEvent( 'Pawksickles', EVENT_ADD_ON_LOADED, function( ... ) Pawksickles:OnLoaded( ... ) end )