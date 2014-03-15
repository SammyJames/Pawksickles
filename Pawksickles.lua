
local kName         = 'Pawksickles'
local Pawksickles   = {}
local EventMgr      = GetEventManager()
local CBM           = CALLBACK_MANAGER
local LMP           = LibStub( 'LibMediaProvider-1.0' )
if ( not LMP ) then return end

LMP:Register( 'font', 'DejaVu Sans', [[Pawksickles/fonts/dejavusans.ttf]] )
LMP:Register( 'font', 'DejaVu Sans Bold', [[Pawksickles/fonts/dejavusans-bold.ttf]] )
LMP:Register( 'font', 'DejaVu Sans BoldOblique', [[Pawksickles/fonts/dejavusans-boldoblique.ttf]] )
LMP:Register( 'font', 'DejaVu Sans Oblique', [[Pawksickles/fonts/dejavusans-oblique.ttf]] )
LMP:Register( 'font', 'DejaVu Sans Mono', [[Pawksickles/fonts/dejavusansmono.ttf]] )
LMP:Register( 'font', 'DejaVu Serif', [[Pawksickles/fonts/dejavuserif.ttf]] )

function Pawksickles:OnLoaded( event, addon )
    if ( addon ~= kName ) then
        return 
    end

    CBM:RegisterCallback( 'PAWKSICKLES_FONT_CHANGED', function( ... ) self:SetFont( ... ) end )
    CBM:FireCallbacks( 'PAWKSICKLES_LOADED' )
end

function Pawksickles:SetFont( object, font )
    _G[ object ]:SetFont( font )
end

EventMgr:RegisterForEvent( 'Pawksickles', EVENT_ADD_ON_LOADED, function( ... ) Pawksickles:OnLoaded( ... ) end )