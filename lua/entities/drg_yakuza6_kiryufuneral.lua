if not DrGBase then return end
ENT.Base = "drg_yakuza6_kiryu"

-- Editables --
ENT.PrintName = "Kazuma Kiryu (Funeral)"
ENT.Category = "Yakuza 6"
ENT.Models = {"models/yakuza6/kazumakiryufuneral.mdl"}
ENT.CollisionBounds = Vector(13, 13, 74)
ENT.Factions = {FACTION_REBELS}

if SERVER then
function ENT:CustomInitialize()
	self.Combat = false
	self.Attacking = false
	self.Cmb01 = true
	self.Dragon = true
	self.Rush = false
	self.Beast = false
	self.Brawler = false
	self.Safety = true
	self.Flinches = 0
	self.DFlinches = 0
	self.ToughnessZ = 1
	self.HeatC = 0
	self.Style = 1
	self.BuildUp = 0
	self.Stamina = 100
	self.Emote = 1
	for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") then self:SetAttack(v,true)end end
	self:SetDefaultRelationship(D_HT)
	self:SetPlayersRelationship(D_LI)
end
end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)