

CreateConVar("drg_yakuza6_kiryumusic", 0, FCVAR_ARCHIVE, "Enable Kiryus Music", 0, 1)

local function DRG_YAKUZA6(Panel)
    if !game.SinglePlayer() then
        if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
            Panel:AddControl( "Label", {Text = "You are not an admin!"})
            Panel:ControlHelp("Notice: Only admins can change this settings.")
            return
        end
    end

    Panel:AddControl("Checkbox", {Label = "Enable Kiryus Music", Command = "drg_yakuza6_kiryumusic"})
end
hook.Add("PopulateToolMenu", "DRG_ADDTOMENU_6", function()spawnmenu.AddToolMenuOption("DrGBase", "Yakuza", "Yakuza 6", "Yakuza 6 Music", "", "", DRG_YAKUZA6, {})end)