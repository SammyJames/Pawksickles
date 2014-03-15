
local LAM = LibStub( 'LibAddonMenu-1.0' )
local LMP = LibStub( 'LibMediaProvider-1.0' )

if ( not LAM ) then return end
if ( not LMP ) then return end

local tsort = table.sort
local tinsert = table.insert

local PawksicklesConfig = 
{
    _name = '_pawksickles',
    _headers = setmetatable( {}, { __mode = 'kv' } )
}

local CBM = CALLBACK_MANAGER

local THIN          = 'soft-shadow-thin'
local THICK         = 'soft-shadow-thick'
local SHADOW        = 'shadow'
local NONE          = 'none'
 
local defaults =
{
    ZoFontWinH1 = { face = 'DejaVu Sans Bold', size = 22, decoration = THICK },
    ZoFontWinH2 = { face = 'DejaVu Sans Bold', size = 20, decoration = THICK },
    ZoFontWinH3 = { face = 'DejaVu Sans Bold', size = 18, decoration = THICK },
    ZoFontWinH4 = { face = 'DejaVu Sans Bold', size = 16, decoration = THICK },
    ZoFontWinH5 = { face = 'DejaVu Sans Bold', size = 14, decoration = THIN },

    ZoFontWinT1 = { face = 'DejaVu Sans', size = 12, decoration = THIN },

    ZoFontGame = { face = 'DejaVu Sans', size = 12, decoration = THIN },
    ZoFontGameMedium = { face = 'DejaVu Sans', size = 12, decoration = THIN },
    ZoFontGameBold = { face = 'DejaVu Sans Bold', size = 12, decoration = THIN },
    ZoFontGameOutline = { face = 'DejaVu Sans Bold', size = 12, decoration = THIN },
    ZoFontGameShadow = { face = 'DejaVu Sans Bold', size = 12, decoration = THIN },
    
    ZoFontGameSmall = { face = 'DejaVu Sans', size = 9, decoration = THIN },
    ZoFontGameLarge = { face = 'DejaVu Sans', size = 14, decoration = THIN },
    ZoFontGameLargeBold = { face = 'DejaVu Sans Bold', size = 14, decoration = THICK },
    ZoFontGameLargeBoldShadow = { face = 'DejaVu Sans Bold', size = 14, decoration = THICK },

    ZoFontHeader  = { face = 'DejaVu Sans Bold', size = 12, decoration = THIN },
    ZoFontHeader2  = { face = 'DejaVu Sans Bold', size = 14, decoration = THIN },
    ZoFontHeader3  = { face = 'DejaVu Sans Bold', size = 16, decoration = THIN },
    ZoFontHeader4  = { face = 'DejaVu Sans Bold', size = 18, decoration = THIN },

    ZoFontCallout  = { face = 'DejaVu Sans Bold', size = 20, decoration = THICK },
    ZoFontCallout2  = { face = 'DejaVu Sans Bold', size = 22, decoration = THICK },
    ZoFontCallout3  = { face = 'DejaVu Sans Bold', size = 24, decoration = THICK },

    ZoFontEdit  = { face = 'DejaVu Sans', size = 12, decoration = SHADOW },
    ZoLargeFontEdit  = { face = 'DejaVu Sans', size = 21, decoration = SHADOW },
    
    ZoFontChat  = { face = 'DejaVu Sans', size = 12, decoration = THIN },
    ZoFontEditChat  = { face = 'DejaVu Sans', size = 14, decoration = SHADOW },
    
    ZoFontWindowTitle  = { face = 'DejaVu Sans BoldOblique', size = 24, decoration = THICK },
    ZoFontWindowSubtitle  = { face = 'DejaVu Sans', size = 14, decoration = THICK },

    ZoFontTooltipTitle  = { face = 'DejaVu Sans BoldOblique', size = 18, decoration = NONE },
    ZoFontTooltipSubtitle  = { face = 'DejaVu Sans', size = 14, decoration = NONE },

    ZoFontAnnounce  = { face = 'DejaVu Sans BoldOblique', size = 22, decoration = THICK },
    ZoFontAnnounceMessage  = { face = 'DejaVu Sans Bold', size = 20, decoration = THICK },

    ZoFontAnnounceSmall  = { face = 'DejaVu Sans BoldOblique', size = 12, decoration = THICK },
    ZoFontAnnounceMedium  = { face = 'DejaVu Sans BoldOblique', size = 20, decoration = THICK },
    ZoFontAnnounceLarge  = { face = 'DejaVu Sans BoldOblique', size = 28, decoration = THICK },

    ZoFontCenterScreenAnnounceLarge  = { face = 'DejaVu Sans BoldOblique', size = 28, decoration = THICK },
    ZoFontCenterScreenAnnounceSmall  = { face = 'DejaVu Sans BoldOblique', size = 20, decoration = THICK },

    ZoFontAlert  = { face = 'DejaVu Sans BoldOblique', size = 18, decoration = THICK },

    ZoFontConversationName  = { face = 'DejaVu Sans BoldOblique', size = 20, decoration = THICK },
    ZoFontConversationText  = { face = 'DejaVu Sans', size = 18, decoration = THICK },
    ZoFontConversationOption  = { face = 'DejaVu Sans Oblique', size = 14, decoration = THICK },
    ZoFontConversationQuestReward  = { face = 'DejaVu Sans', size = 14, decoration = THICK },

    ZoFontKeybindStripKey  = { face = 'DejaVu Sans Bold', size = 14, decoration = THIN },
    ZoFontKeybindStripDescription  = { face = 'DejaVu Sans Bold', size = 14, decoration = THICK },
    
    ZoInteractionPrompt  = { face = 'DejaVu Sans', size = 16, decoration = THIN },
    
    ZoFontBookPaper  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookSkin  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookRubbing  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookLetter  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookNote  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookScroll  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookTablet  = { face = 'DejaVu Serif', size = 14, decoration = NONE },
    ZoFontBookPaperTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookSkinTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookRubbingTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookLetterTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookNoteTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookScrollTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    ZoFontBookTabletTitle  = { face = 'DejaVu Serif', size = 20, decoration = NONE },
    
    ZoFontBossName  = { face = 'DejaVu Sans BoldOblique', size = 16, decoration = THIN },
    ZoFontBoss  = { face = 'DejaVu Sans Bold', size = 12, decoration = THIN }
}

local logical = {}
local decorations = { 'none', 'soft-shadow-thin', 'soft-shadow-thick', 'shadow' }

function PawksicklesConfig:FormatFont( fontEntry )
    local str = '%s|%d'
    if ( fontEntry.decoration ~= NONE ) then
        str = str .. '|%s'
    end

    return string.format( str, LMP:Fetch( LMP.MediaType.FONT, fontEntry.face ), fontEntry.size or 10, fontEntry.decoration )
end

function PawksicklesConfig:OnLoaded()
    self.db = ZO_SavedVars:NewAccountWide( 'PAWKSICKLES_DB', 1.0, nil, defaults )

    for k,_ in pairs( defaults ) do
        tinsert( logical, k )
    end

    tsort( logical )

    self.config_panel = LAM:CreateControlPanel( self._name, 'Pawksickles' )

    self:BeginAddingOptions()
end

function PawksicklesConfig:BeginAddingOptions()
    for i=1,#logical do 
        local gameFont = tostring( logical[ i ] )
        if ( self.db[ gameFont ] ) then 
            CBM:FireCallbacks( 'PAWKSICKLES_FONT_CHANGED', gameFont, self:FormatFont( self.db[ gameFont ] ) )   

            local header = LAM:AddHeader( self.config_panel, self._name .. '_header_' .. i, gameFont ):GetNamedChild( 'Label' )
            header:SetFont( self:FormatFont( self.db[ gameFont ] ) )
            self._headers[ gameFont ] = header

            LAM:AddDropdown( self.config_panel, self._name .. '_font_' .. i, 'Font:', '', LMP:List( LMP.MediaType.FONT ), 
                function() return self.db[ gameFont ].face end, 
                function( selection )  self:FontDropdownChanged( gameFont, selection ) end )

            LAM:AddSlider( self.config_panel, self._name .. '_size_' .. i, 'Size:', '', 5, 50, 1, 
                function() return self.db[ gameFont ].size end, 
                function( size ) self:SliderChanged( gameFont, size ) end )

            LAM:AddDropdown( self.config_panel, self._name .. '_decoration_' .. i, 'Decoration:', '', decorations,
                function() return self.db[ gameFont ].decoration end,
                function( selection ) self:DecorationDropdownChanged( gameFont, selection ) end )
        end
    end
end

function PawksicklesConfig:FontDropdownChanged( gameFont, fontFace )
    self.db[ gameFont ].face = fontFace 
    local newFont = self:FormatFont( self.db[ gameFont ] )
    if ( self._headers[ gameFont ] ) then
        self._headers[ gameFont ]:SetFont( newFont )
    end

    CBM:FireCallbacks( 'PAWKSICKLES_FONT_CHANGED', gameFont, newFont ) 
end

function PawksicklesConfig:SliderChanged( gameFont, size )
    self.db[ gameFont ].size = size 
    local newFont = self:FormatFont( self.db[ gameFont ] ) 
    if ( self._headers[ gameFont ] ) then
        self._headers[ gameFont ]:SetFont( newFont )
    end

    CBM:FireCallbacks( 'PAWKSICKLES_FONT_CHANGED', gameFont, newFont ) 
end

function PawksicklesConfig:DecorationDropdownChanged( gameFont, decoration )
    self.db[ gameFont ].decoration = decoration 
    local newFont = self:FormatFont( self.db[ gameFont ] )
    if ( self._headers[ gameFont ] ) then
        self._headers[ gameFont ]:SetFont( newFont )
    end

    CBM:FireCallbacks( 'PAWKSICKLES_FONT_CHANGED', gameFont, newFont ) 
end

CBM:RegisterCallback( 'PAWKSICKLES_LOADED', function( ... ) PawksicklesConfig:OnLoaded( ... ) end )