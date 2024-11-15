if not DrGBase then return end
ENT.Base = "drgbase_nextbot"

-- Editables --
ENT.PrintName = "Yakuza"
ENT.Category = "Yakuza 6"
ENT.Models = {"models/yakuza6/allshare.mdl"}
ENT.CollisionBounds = Vector(13, 13, 74)
ENT.SpawnHealth = math.random(50,200)
ENT.ShoveResistance = true
ENT.MeleeAttackRange = 60
ENT.RangeAttackRange = 200
ENT.ReachEnemyRange = 80
ENT.StrafeMin = 50
ENT.StrafeMax = 175
ENT.Factions = {"FACTION_YAKUZA"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.RagdollOnDeath = false
ENT.Omniscient = false
ENT.SpotDuration = 60
ENT.ReachEnemyRange = 60
ENT.SightFOV = 360
ENT.UseWalkframes = true 
ENT.Spawnable = false
ENT.AtkCooldown1 = 4
ENT.AtkCooldown2 = 10
ENT.HeatAtkCooldown1 = 0.5
ENT.HeatAtkCooldown2 = 2
ENT.RangeAtkCooldown1 = 5
ENT.RangeAtkCooldown2 = 15
ENT.DodgeCoolDown = 1.5
ENT.DodgeChance = 8
ENT.WeaponRange = 50
ENT.WeaponModel = 0
-- 0 
-- 1 
-- 2 
-- 3 
-- 4 
-- 5 
-- 6 
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14 
-- 15 
-- 16 
-- 17 
-- 18 
-- 19 
-- 20 
-- 21 
-- 22 
-- 23 
-- 24 
-- 25 
-- 26 
-- 27 
-- 28 
-- 29 
-- 30 
-- 31 
-- 32 
ENT.WeaponType = 0
-- 0 Blunt
-- 1 Sharp
-- 2 Electric
-- 3 Poison
-- 4 Explosive
ENT.HeatHealth = 2 -- Max Health Divided By This
ENT.HeatParticle = "brawler_heat" -- Direct Particle Name

ENT.ClimbLedges = false
ENT.ClimbProps = false
ENT.ClimbLadders = false

-- Yakuza Sounds --
ENT.AttackSmallSounds = {}
ENT.AttackLargeSounds = {}
ENT.AttackXSSounds = {}
ENT.AttackXLSounds = {}
ENT.PainSounds = {}
ENT.PainHeadSounds = {}
ENT.PainHeadLSounds = {}
ENT.PainBodySounds = {}
ENT.PainBodyLSounds = {}
ENT.PainXLSounds = {}
ENT.StandSounds = {}
ENT.AngrySounds = {}
ENT.FearSounds = {}
ENT.ThrowSounds = {}
ENT.ProvokeSounds = {}
ENT.DeadSounds = {}
ENT.VanishSounds = {}
ENT.SupriseSounds = {}
ENT.HoldSounds = {}
ENT.StartSounds = {}
ENT.TubazeriSounds = {}
ENT.SyncSounds = {}

ENT.WeaponGuardSounds = {}
ENT.WeaponSwingSounds = {}
ENT.WeaponHitSounds = {}

-- Possession --
ENT.EyeBone = "face_c_n"
ENT.EyeOffset = Vector(0, 0, 2.5)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.PossessionCrosshair = true
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_CUSTOM
ENT.PossessionViews = {{offset = Vector(0, 0, 30),distance = 100,eyepos=false},{offset = Vector(7.5, 0, 0),distance = 0,eyepos = true}}
ENT.PossessionBinds = {
	[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)
	if self.Normal then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.KBox then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kbx_cmbkick01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Box then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("box_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Cpr then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cpr_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Karate then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("krt_cmbpunch01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("krt_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Inf then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Sir then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("sir_atk_rendapunch",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("sir_atk_kick",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("sir_atk_dempsey",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("sir_atk_shoulder_miss",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Judo then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("jdo_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Mnm then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Msk then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_cmb01_c",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Gor then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_cmbsholder01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Fat then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Yop then
		if self.Hide then
			//self.Attacking = true
			self.Damage = 1
			self.SetupType = DMG_GENERIC
			self.Sync = true
			self.SPDamage = 40
			self.SPSound = 25
			self.SyncFAnimation = "jyu_sync_atk_sukui"
			self.SyncBAnimation = "jyu_sync_atk_sukui"
			self.Sync1FAnimation = "jyu_atk_sukui_sync1"
			self.Sync1BAnimation = "jyu_atk_sukui_sync1"
			self:PlaySequenceAndMove("jyu_atk_sukui_miss",1.5,self.PossessionFaceForward)
			self.Sync = false
			self:AttackReset()
		else
			//self.Attacking = true
			self.Damage = 15
			self.SetupType = DMG_GENERIC
			self:PlaySequenceAndMove("yop_atk_punch_2ren",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
			self:AttackReset()
		end
	elseif self.Jak then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("jak_atk_kungfupunch",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("jak_atk_snakechopsting",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("jak_atk_brucekick",1)
		self:AttackReset()
		end
	elseif self.JkS then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 15
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("jak_sword_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 15
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("jak_sword_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Bat then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("bat_cmb_3ren",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
	elseif self.Aiz then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmbhook01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmbsp01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Knife then
		//self.Attacking = true
		self.Damage = 35
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("knife_atk_tuki",1)
		self:AttackReset()
	elseif self.Knife2 then
		//self.Attacking = true
		self.Damage = 10
		self.KDamage = 30
		if self.Taser then
		self.KnifeType = DMG_SHOCK
		else
		self.KnifeType = DMG_SLASH
		end
		self:PlaySequenceAndMove("knife2_cmb01",1,function(self,cycle)if cycle < 0.2 then self:PossessionFaceForward() end end)
	elseif self.Katana or self.WKatana then
		//self.Attacking = true
		self.Damage = 10
		if self.Katana then
		self.SetupType = DMG_SLASH
		else
		self.SetupType = DMG_GENERIC
		end
		self:PlaySequenceAndMove("lumb_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Tnn then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tnn_cmb01_power",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tnn_cmb01_assassin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Iha then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iha_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iha_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Sai then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 20
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 20
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Cap then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb01_dodge_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb01_dodge_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Tam then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb01_c",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb01_d",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Lee then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("lee_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("lee_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
	elseif self.Ric then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb01_b",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb01_sp",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb01_c",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		else
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb01_a",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		end
	end
	end}},
	[IN_ATTACK2] = {{coroutine = true,onkeydown = function(self)
	local lockedOn = self:PossessionGetLockedOn()
	if self.Hide then return end
	if self.Normal then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_punch",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("atk_runpunch",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) and self:IsRunning() then
		//self.Attacking = true
		self.Damage = 35
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_run2hitcombo",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_chop",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 35
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("atk_runknee",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_kick",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.KBox then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kbx_atk_lowkick",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("kbx_atk_flyingknee",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 35
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("kbx_atk_rollkick",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 35
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kbx_atk_kick",1)
		self:AttackReset()
		end
	elseif self.Box then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("box_atk_upper",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("box_atk_jab",1)
		self:AttackReset()
		end
	elseif self.Tackle then
		if self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tac_atk_hook",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("tac_atk_punch_3ren",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tac_atk_run",1)
		self:AttackReset()
		end	
	elseif self.Cpr then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cpr_atk_chop",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("cpr_atk_hammer",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cpr_atk_kick",1)
		self:AttackReset()
		end
	elseif self.Karate then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("krt_atk_turning_kick",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("krt_atk_knee",1)
		self:AttackReset()
		end
	elseif self.Inf then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_NEVERGIB
		self:PlaySequenceAndMove("inf_atk_heavy",1)
		self:AttackReset()
	elseif self.Sir then
		if self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("sir_atk_away_kick_l",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("sir_atk_away_kick_r",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("sir_atk_away_upper",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("sir_atk_away_hook",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Judo then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("jdo_atk_punch_3ren",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("jdo_atk_hook",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Mnm then
		if self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("mnm_atk_run",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Msk then
		if self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self.Sync = true
		self.SPDamage = 40
		self.SPSound = 25
		self.SyncFAnimation = "msk_atk_jump_run_sync"
		self.SyncBAnimation = "msk_atk_jump_run_sync"
		self.Sync1FAnimation = "msk_atk_jump_run_f_sync1"
		self.Sync1BAnimation = "msk_atk_jump_run_b_sync1"
		self:PlaySequenceAndMove("msk_atk_run_miss",1)
		self.Sync = false
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self.Sync = true
		self.SPDamage = 20
		self.SyncFAnimation = "msk_atk_jump_nage_sync"
		self.SyncBAnimation = "msk_atk_jump_nage_sync"
		self.Sync1FAnimation = "msk_atk_jump_nage_f_sync1"
		self.Sync1BAnimation = "msk_atk_jump_nage_b_sync1"
		self:PlaySequenceAndMove("msk_atk_jump_miss",1)
		self.Sync = false
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_atk_heavy_kick",1)
		self:AttackReset()
		end
	elseif self.Gor then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("gor_atk_02",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_atk_01",1)
		self:AttackReset()
		end
	elseif self.JkS then
		//self.Attacking = true
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 25
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("jak_sword_atk_2ren",1)
		self:AttackReset()
	elseif self.Fat then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 50
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("fat_atk_tame_sp",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) and self:IsRunning() then
		//self.Attacking = true
		self.Damage = 40
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("fat_atk_run_dropkick",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 40
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("fat_atk_enzui",1,function(self,cycle)if cycle < 0.4 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_atk_headbutt",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_atk_kick",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Yop then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.YOPSZ = true
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("yop_seize_grab_miss",1)
		self.YOPSZ = false
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("yop_atk_kick",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		self:AttackReset()
		self:PlaySequenceAndMove("yop_drink_st",1)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("yop_atk_knee",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("yop_atk_punch",1)
		self:AttackReset()
		end
	elseif self.Jak then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("jak_atk_tobigeri",1)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("jak_atk_senpukyaku",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("jak_atk_nirenkiyaku",1)
		self:AttackReset()
		end
	elseif self.Bat then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_NEVERGIB
		self:PlaySequenceAndMove("bat_atk_jump",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_FORWARD) and self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("bat_atk_run",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("bat_atk_heavy",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Knife or self.Taser then
		if self:IsRunning() then
		//self.Attacking = true
		self.Damage = 10
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_BULLET
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_BULLET
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("knife_atk_run_sting",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 15
		self.WeaponDamage = 25
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("knife_atk_tuki_upper",1)
		self:AttackReset()
		end
	elseif self.Knife2 then
		if self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 35
		self.KDamage = 30
		if self.Taser then
		self.KnifeType = DMG_SHOCK
		else
		self.KnifeType = DMG_SLASH
		end
		self:PlaySequenceAndMove("knife2_atk_sting_3ren",1,function(self,cycle)if cycle < 0.3 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 15
		self.KDamage = 25
		self.Fin = true
		if self.Taser then
		self.KnifeType = DMG_SHOCK
		else
		self.KnifeType = DMG_SLASH
		end
		self:PlaySequenceAndMove("knife2_atk",1)
		self:AttackReset()
		self.Fin = false
		end
	elseif self.Katana or self.WKatana then
		//self.Attacking = true
		self.Damage = 35
		self.WeaponDamage = 35
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_BULLET
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("lumb_atk_tuki",1)
		self:AttackReset()
	elseif self.Tnn then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tnn_atk_3rentsuki",1)
		self.Tsuki = false
		self.Fin = false
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 35
		self.Fin = true
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("tnn_atk_kiri_c",1)
		self:AttackReset()
		self.Fin = false
		elseif lockedOn.Downed then
		//self.Attacking = true
		self.Damage = 25
		self.Fin = false
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("tnn_atk_down",1)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 35
		self.Fin = true
		self.Tsuki = true
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("tnn_atk_tsuki",1)
		self.Fin = false
		self.Tsuki = false
		self:AttackReset()
		end
	elseif self.Iha then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 25
		self.NoDown = true
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("iha_atk_heavy_straight",1)
		self.NoDown = false
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 40
		self.NoDown = true
		self.SetupType = DMG_VEHICLE
		self:PlaySequenceAndMove("iha_atk_headbutt",1)
		self.NoDown = false
		self:AttackReset()
		elseif lockedOn.Downed then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.Trample = true
		self:FaceInstant(lockedOn)
		self:PlaySequenceAndMove("iha_atk_down",1)
		self.Trample = false
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iha_atk_kick",1)
		self:AttackReset()
		end
	elseif self.Sai then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 40
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("sai_atk_jump",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:IsRunning() then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("sai_atk_run_bodypress",1,function(self,cycle)if cycle < 0.2 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif lockedOn.Downed then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Trample = true
		self:FaceInstant(lockedOn)
		self:PlaySequenceAndMove("sai_atk_down",1)
		self.Trample = false
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_FALL
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Cap then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 40
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("cap_atk_backflip",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("cap_atk_kick_low",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("cap_atk_kick_mid",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 30
		self.NoDown = true
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("cap_atk_kick_hi",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		self.NoDown = false
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_atk_kick0"..math.random(2),1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Tam then
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("tam_atk_hammer",1,function(self,cycle)if cycle < 0.4 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("tam_atk_upper",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		//self.Attacking = true
		self.Damage = 50
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("tam_atk_heavy_hammer",1,function(self,cycle)if cycle < 0.4 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_atk_uraken",1,function(self,cycle)if cycle < 0.4 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Lee then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("lee_atk_kick_hi",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("lee_atk_kick_mid",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:IsRunning() then
		//self.Attacking = true
		self.Damage = 50
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("lee_atk_run_kick",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_CRUSH
		self.Stun = true
		self.NoDown = true
		self:PlaySequenceAndMove("lee_atk_punch",1,function(self,cycle)if cycle < 0.1 then self:PossessionFaceForward() end end)
		self:AttackReset()
		self.Stun = false
		self.NoDown = false
		end
	elseif self.Ric then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.NoDown = true
		self.Damage = 15
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("ric_atk_sway_f_kick",1,function(self,cycle)if cycle < 0.1 then self:PossessionFaceForward() end end)
		self.NoDown = false
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) and not self:IsRunning() then
		//self.Attacking = true
		self.BoundG = true
		self.Damage = 40
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("ric_atk_kick_ssk",1,function(self,cycle)if cycle < 0.1 then self:PossessionFaceForward() end end)
		self.BoundG = false
		self:AttackReset()
		elseif self:IsRunning() then
		//self.Attacking = true
		self.Damage = 50
		self.Stun = true
		self.NoDown = true
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("ric_atk_run_kick",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		self.Stun = false
		self.NoDown = false
		elseif lockedOn.Downed then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Trample = true
		self:FaceInstant(lockedOn)
		self:PlaySequenceAndMove("ric_atk_down",1)
		self.Trample = false
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("ric_atk_kick_jump",1,function(self,cycle)if cycle < 0.1 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	elseif self.Aiz then
		if self:GetPossessor():KeyDown(IN_FORWARD) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("aiz_atk_hook",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_BACK) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 45
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("aiz_atk_hammer",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_atk_dodge_r",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) and not self:IsRunning() then
		//self.Attacking = true
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_atk_dodge_l",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif self:IsRunning() then
		//self.Attacking = true
		self.Damage = 35
		self.SetupType = DMG_VEHICLE
		self:PlaySequenceAndMove("aiz_atk_run",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
		self:AttackReset()
		elseif lockedOn.Downed then
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.Trample = true
		self:FaceInstant(lockedOn)
		self:PlaySequenceAndMove("aiz_atk_down",1)
		self.Trample = false
		self:AttackReset()
		else
		//self.Attacking = true
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_atk_kick",1,function(self,cycle)if cycle < 0.3 then self:PossessionFaceForward() end end)
		self:AttackReset()
		end
	end
	end}},
	[IN_RELOAD] = {{coroutine = true,onkeydown = function(self)
		if not self.Combat then
		self.Combat = true
		if self.A then
		self:PlaySequenceAndMove("enc_run_a_stop",1)
	if self.Bat then
	self:PlaySequenceAndMove("enc_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana then
	self:PlaySequenceAndMove("enc_lumb_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun then
	self:PlaySequenceAndMove("enc_gun_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
		self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
		elseif self.B then
		self:PlaySequenceAndMove("enc_run_b_stop",1)
	if self.Bat then
	self:PlaySequenceAndMove("enc_bat_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana then
	self:PlaySequenceAndMove("enc_lumb_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun then
	self:PlaySequenceAndMove("enc_gun_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
		self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
		end
		self:Stance()
		else
		if self.Yop then
			if self.Hide then
				self:PlaySequenceAndMove("fear1",1)
			else
				self:PlaySequenceAndMove("yop_provoke",1)
			end
		elseif self.Katana or self.WKatana then
		self:PlaySequenceAndMove("batton_provoke",1)
		elseif self.Mnm then
		self:PlaySequenceAndMove("mnm_provoke",1)
		elseif self.Tnn then
		if math.random(2)==1 then
		self:PlaySequenceAndMove("tnn_provoke_b",1)
		else
		self:PlaySequenceAndMove("tnn_provoke_a",1)
		end
		elseif self.Iha then
		self:PlaySequenceAndMove("iha_provoke",1)
		elseif self.Sai then
		if IsValid(self.Weapon) then
			if self.Weapon:GetBodygroup(0) == 32 then
				self:PlaySequenceAndMove("oda_provoke",1)
			else
				self:PlaySequenceAndMove("sai_provoke",1)
			end
		else
			self:PlaySequenceAndMove("sai_provoke",1)
		end
		elseif self.Tam then
		self:PlaySequenceAndMove("tam_provoke",1)
		elseif self.Knd or self.Fat then
		self:PlaySequenceAndMove("knd_provoke",1)
		elseif self.FBat then
		self:PlaySequenceAndMove("fat_bat_provoke",1)
		elseif self.Ric then
		self:PlaySequenceAndMove("ric_provoke",1)
		elseif self.Aiz then
		self:PlaySequenceAndMove("aiz_provoke"..math.random(2),1)
		else
		self:PlaySequenceAndMove("provoke"..math.random(19),1)
		end
		end
	end}},
	[IN_USE] = {{coroutine = true,onkeydown = function(self)
   self:CICO(function()
	if self:GetCooldown("DodgeAnim")<=0 then
		self:SetCooldown("DodgeAnim",0.5)
		self:AttackReset()
		self.Dodge = true
		self:EmitSound("common/sway"..math.random(3)..".wav")
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		self:PlaySequenceAndMove(self.SwayForwardAnimation,1,self.PossessionFaceForward)
		self:SetCooldown("KuzeAttack",0)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		self:PlaySequenceAndMove(self.SwayRightAnimation,1,self.PossessionFaceForward)
		self:SetCooldown("KuzeAttack",0)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		self:PlaySequenceAndMove(self.SwayBackAnimation,1,self.PossessionFaceForward)
		self:SetCooldown("KuzeAttack",0)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		self:PlaySequenceAndMove(self.SwayLeftAnimation,1,self.PossessionFaceForward)
		self:SetCooldown("KuzeAttack",0)
		else
		self:PlaySequenceAndMove(self.SwayBackAnimation,1,self.PossessionFaceForward)
		self:SetCooldown("KuzeAttack",0)
		end
		self.Dodge = false
	end
   end)
	end}},
	[IN_DUCK] = {{coroutine = true,onkeydown = function(self)
	if self:IsDead() or self.Downed or self.Dodge then return end
	self.Blocking = true
	self.GuardHP = 100
	self:PlaySequenceAndMove(self.GuardStartAnimation)
	while self:GetPossessor():KeyDown(IN_DUCK) and self.Blocking do
		self:PlaySequenceAndMove(self.GuardLoopAnimation)
	end
	if self.Blocking then
	self.Blocking = false
	self:PlaySequenceAndMove(self.GuardEndAnimation)
	end
	end}},
}
ENT.IdleAnimation = "stand_idle"
ENT.WalkAnimation = "walk"..math.random(1,2,3)
ENT.RunAnimation = "enc_run_a"
ENT.JumpAnimation = "fall"
ENT.SwayForwardAnimation = "sway_f"
ENT.SwayBackAnimation = "sway_b"
ENT.SwayRightAnimation = "sway_r"
ENT.SwayLeftAnimation = "sway_l"
ENT.GuardStartAnimation = "guard_st"
ENT.GuardLoopAnimation = "guard_lp"
ENT.GuardEndAnimation = "guard_en"
ENT.GuardHitAnimation = "guard_hit"
ENT.ShiftIdleAnimation = "shift_idle"..math.random(1,2)
ENT.ShiftAnimation = "shift"
ENT.ShiftRunAnimation = "enc_run_a"
	
if SERVER then
function ENT:PossessionControls(f,b,r,l)
	if not self:IsRunning() and self.Combat then
		if self:IsMoving() then self:PossessionFaceForward() end
		local dir = self._DrGBasePossLast4DIR or ""
		if f and (dir == "" or dir == "N") then
			self:PossessionMoveForward()
			self._DrGBasePossLast4DIR = "N"
		elseif b and (dir == "" or dir == "S") then
			self:PossessionMoveBackward()
			self._DrGBasePossLast4DIR = "S"
		elseif r and (dir == "" or dir == "E") then
			self:PossessionMoveRight()
			self._DrGBasePossLast4DIR = "E"
		elseif l and (dir == "" or dir == "W") then
			self:PossessionMoveLeft()
			self._DrGBasePossLast4DIR = "W"
		else self._DrGBasePossLast4DIR = "" end
	else
		local direction = self:GetPos()
		if f then direction = direction + self:PossessorForward()
		elseif b then direction = direction - self:PossessorForward() end
		if r then direction = direction + self:PossessorRight()
		elseif l then direction = direction - self:PossessorRight() end
		if direction ~= self:GetPos() then self:MoveTowards(direction)
		else self:PossessionFaceForward() end
	end
end
function ENT:CustomInitialize()
	self.Combat = false
	self:AttackReset()
	self.Flinches = 0
	self.DFlinches = 0
	self.CanAngry = true
	self:SetMaxHealth(math.random(50,200))
	self:SetHealth(self:GetMaxHealth())
	self.Heat = false
	local ab = math.random(2)
	if ab==1 then
	self.A = true
	self.RunAnimation = "enc_run_a"
	elseif ab==2 then
	self.B = true
	self.RunAnimation = "enc_run_b"
	end
	local e = math.random(1,8)
	if e==2 then
	self:SetModelScale(1.1)
	self:SetCollisionBounds(Vector(-16.25,-16.25,0),Vector(13.5,13.5,70))
	elseif e==4 then
	self:SetModelScale(0.9)
	end
	local moveset = math.random(1,9)
	if moveset==1 then
	self.Normal = true
	elseif moveset==2 then
	self.Box = true
	elseif moveset==3 then
	self.Cpr = true
	elseif moveset==4 then
	self.KBox = true
	elseif moveset==5 then
	self.Tackle = true
	elseif moveset==6 then
	self.Karate = true
	elseif moveset==7 then
	self.Sir = true
	elseif moveset==8 then
	self.inf = true
	elseif moveset==9 then
	self.Iha = true
	end
	self.Knt = true
	self.Yakuza = true
	local voice = math.random(1,3)
	if voice==1 then
	self.Set1 = true
	elseif voice==2 then
	self.Set2 = true
	elseif voice==3 then
	self.Set3 = true
	end
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(0,math.random(0,2))
	if self:GetBodygroup(0) == 1 then
	self:SetBodygroup(1,math.random(5,8))
	elseif self:GetBodygroup(0) == 2 then
	self:SetBodygroup(1,math.random(9,10))
	else
	self:SetBodygroup(1,math.random(0,4))
	end
	if self:GetBodygroup(0) == 1 then
	self:SetBodygroup(2,math.random(4,7))
	elseif self:GetBodygroup(0) == 2 then
	self:SetBodygroup(2,8)
	else
	self:SetBodygroup(2,math.random(0,3))
	end
	self:SetBodygroup(3,math.random(0,10))
	self:SetBodygroup(4,math.random(0,6))
	for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") then self:SetAttack(v,true)end end
	self:SetDefaultRelationship(D_HT)
end
function ENT:OnLandOnGround()
	if self:IsDead() or self:IsDown() or self.Downed then return end
	self:CICO(function(self, delay)
		self:EmitSound("common/body2.wav")
		self:PlaySequenceAndMove("land",1)
	end)
end

ENT.SetupType = bit.bor(DMG_GENERIC)
ENT.WeaponDamageType = bit.bor(DMG_GENERIC)
ENT.KnifeType = bit.bor(DMG_SLASH)
function ENT:HandleAnimEvent(a,b,c,d,e)
	if e == "attack" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=50,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				if self.Boss then
				self:EmitSound("yakuza0/weapons/fists/boss/hit"..math.random(4)..".wav")
				else
				self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "spinattack" or e == "batattack" or e == "kattack" or e == "lumattack" or e == "couch" then
		self.Attacking = false
		self.Swinging = false
		if not IsValid(self.Weapon) and not IsValid(self.Chair) then
			self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
		else
		self:Attack({
			damage = self.WeaponDamage,
			type = self.WeaponDamageType,
			range=self.WeaponRange,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				if #self.WeaponHitSounds > 0 then
					self:EmitSound(self.WeaponHitSounds[math.random(#self.WeaponHitSounds)])
				else
					self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				end
			else
				if #self.WeaponSwingSounds > 0 then
					self:EmitSound(self.WeaponSwingSounds[math.random(#self.WeaponSwingSounds)])
				else
					self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
				end
			end
		end)
		end
	end
	if e == "spinattack" then
		self.Attacking = false
		self.Swinging = false
		if not IsValid(self.Weapon) then
			self:EmitSound("weapons/fists/swing_kick"..math.random(3)..".wav")
		else
		self:Attack({
			damage = self.WeaponDamage,
			type = self.WeaponDamageType,
			range=self.WeaponRange,
			angle=360,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				if #self.WeaponHitSounds > 0 then
					self:EmitSound(self.WeaponHitSounds[math.random(#self.WeaponHitSounds)])
				else
					self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				end
			else
				if #self.WeaponSwingSounds > 0 then
					self:EmitSound(self.WeaponSwingSounds[math.random(#self.WeaponSwingSounds)])
				else
					self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
				end
			end
		end)
		end
	end
	if e == "ksting" then
		self.Attacking = false
		self.Swinging = false
		if not IsValid(self.Weapon) then
			self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
		else
		self:Attack({
			damage = self.WeaponDamage,
			type = self.WeaponDamageType,
			range=self.WeaponRange,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				if #self.WeaponHitSounds > 0 then
					self:EmitSound(self.WeaponHitSounds[math.random(#self.WeaponHitSounds)])
				end
				self:CICO(function()
				self:PlaySequenceAndMove("knife_atk_run_sting_hit",1,self.FaceEnemy)
				end)
			else
				if #self.WeaponSwingSounds > 0 then
					self:EmitSound(self.WeaponSwingSounds[math.random(#self.WeaponSwingSounds)])
				end
			end
		end)
		end
	end
	if e == "spattack" then
		self.Attacking = false
		self.Swinging = false
		if IsValid(self.Target) then
			if #self.SyncSounds > 0 then
				self.Target:EmitSound(self.SyncSounds[math.random(#self.SyncSounds)])
			end
		self.Target:TakeDamage(self.SPDamage, self, self)
		end
	end
	if e == "aizspattack" then
		self.Attacking = false
		self.Swinging = false
		if IsValid(self.Target) then
		self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
		self.Target:TakeDamage(10, self, self)
		end
	end
	if e == "spattack_self" then
		if IsValid(self.Target) then
		self.Target:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
		self:TakeDamage(30, self.Target, self.Target)
		end
	end
	if e == "grabattack" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=40,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "tackle" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = DMG_SLASH,
			range=50,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "elbow" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = DMG_FALL,
			range=30,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "grab" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = DMG_GENERIC,
			range=30,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "sirattack" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=30,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				self:CICO(function()
				self:PlaySequenceAndMove("sir_atk_shoulder_hit",1)
				end)
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "lee_attack" then
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=30,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
				self:CICO(function()
				self:PlaySequenceAndMove("lee_cmb02_b_hit",1)
				end)
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("weapons/fists/swing"..math.random(4)..".wav")
			end
		end)
	end
	if e == "saws" then
		self.Fin = true
		self:EmitSound("yakuza0/weapons/chainsaw/swing"..math.random(2)..".wav")
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = 50,
			type = DMG_SLASH,
			range=50,
			angle=360,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("yakuza0/weapons/chainsaw/hit.wav")
				self.Fin = false
			end
		end)
	end
	if e == "saw" then
		self:EmitSound("yakuza0/weapons/chainsaw/swing"..math.random(2)..".wav")
		self.Attacking = false
		self.Swinging = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=50,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("yakuza0/weapons/chainsaw/hit.wav")
			end
		end)
	end
	if e == "heatscale" then
		self.NormalScale = self:GetModelScale()
		self:SetModelScale(1)
	end
	if e == "heatunscale" then
		self:SetModelScale(self.NormalScale)
	end
	if e == "uppah" then
		self:CICO(function()
		self.SetupType = DMG_ALWAYSGIB
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_ALWAYSGIB
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		end)
	end
	if e == "fall" then
		self:CICO(function()
		self.SetupType = DMG_FALL
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		end)
	end
	if e == "poke" then
		self:CICO(function()
		self.Tsuki = true
		self.Fin = true
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		end)
	end
	if e == "bullet" then
		self:CICO(function()
		self.SetupType = DMG_FALL
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_BULLET
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		end)
	end
	if e == "cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cmb02",1)
		end)
	end
	if e == "cmb02trans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "cpr_cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("cpr_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "box_cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("box_cmb02",1)
		end)
	end
	if e == "box_cmb02trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("box_cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "jdo_cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("jdo_cmb02",1)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "gor_cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_cmb02",1)
		end)
	end
	if e == "gor_cmb02trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("gor_cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "gor_cmbsholder01trans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_cmbsholder02",1)
		end)
	end
	if e == "gor_cmbsholder02trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gor_cmbsholder03",1)
		end)
	end
	if e == "gor_cmbsholder03trans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("gor_cmbsholder04",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "kbx_cmbk01trans" then
		self:CICO(function()
		self.Damage = 45
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kbx_cmbkick02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "inf_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb02_a",1)
		end)
	end
	if e == "inf_cmb02atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb03_a",1)
		end)
	end
	if e == "inf_cmb03atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb04_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "inf_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb02_b",1)
		end)
	end
	if e == "inf_cmb02btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb03_b",1)
		end)
	end
	if e == "inf_cmb03btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("inf_cmb04_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "krt_cmb01trans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("krt_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "krt_cmbp01trans" then
		self:CICO(function()
		self.Damage = 35
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("krt_cmbpunch02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "msk_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_cmb02_a",1)
		end)
	end
	if e == "msk_cmb02atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("msk_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "mnm_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb02_b",1)
		end)
	end
	if e == "mnm_cmb02btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb03_b",1)
		end)
	end
	if e == "mnm_cmb03btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("mnm_cmb04_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "mnm_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb02_a",1)
		end)
	end
	if e == "mnm_cmb02atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("mnm_cmb03_a",1)
		end)
	end
	if e == "mnm_cmb03atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("mnm_cmb04_a_double",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		end)
	end
	if e == "mnm_cmb04adoubletrans" then
		self:CICO(function()
		if math.random(2)==1 then
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		self.Damage = 25
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("mnm_cmb05_a_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
		end)
	end
	if e == "mnm_cmb05alowtrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("mnm_cmb06_a_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "msk_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("msk_cmb02_b",1)
		end)
	end
	if e == "msk_cmb02btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("msk_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "msk_cmb01ctrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("msk_cmb02_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "fat_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_cmb02_a",1)
		end)
	end
	if e == "fat_cmb02atrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("fat_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "fat_cmb01btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("fat_cmb02_b",1)
		end)
	end
	if e == "fat_cmb02btrans" then
		self:CICO(function()
		self.Damage = 60
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("fat_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "lumb_cmb01atrans" then
		self:CICO(function()
		self.Damage = 30
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Fin = true
		self:PlaySequenceAndMove("lumb_cmb02_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "jak_sword_cmb01atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("jak_sword_cmb02_a",1)
		end)
	end
	if e == "jak_sword_cmb02atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Fin = true
		self:PlaySequenceAndMove("jak_sword_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "jak_sword_cmb01btrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Fin = true
		self:PlaySequenceAndMove("jak_sword_cmb02_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "aiz_cmb01trans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb02_a",1)
		end)
	end
	if e == "aiz_cmb02trans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end)
	end
	if e == "aiz_cmb03trans" then
		self:CICO(function()
		if self.Boss then
		self.Damage = 45
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb04_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "aiz_cmb04trans" then
		self:CICO(function()
		local cmb = math.random(1,4)
		if cmb!=2 then
		local cmb2 = math.random(1,3)
		if cmb2!=2 then
		self.Damage = 40
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb05_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		else
		self.Damage = 50
		self.Tackle = true
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb05_a1_tackle_miss",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		self.Tackle = false
		end
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "aiz_cmb05trans" then
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb!=2 then
		self.Damage = 45
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmb06_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "aiz_cmb06trans" then
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb!=2 then
		self.Damage = 55
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("aiz_cmb07_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "aiz_cmbsp01trans" then
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb!=2 then
		self.Damage = 30
		self.AIZSP = true
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("aiz_cmbsp02_miss",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.AIZSP = false
		self:AttackReset()
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "aiz_cmbhook01trans" then
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb!=2 then
		self.Damage = 25
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("aiz_cmbhook02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "knife2_cmb01trans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Fin = true
		self:PlaySequenceAndMove("knife2_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "tnn_cmb01assassintrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 25
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("tnn_cmb02_assassin",1)
		end)
	end
	if e == "tnn_cmb02assassintrans" then
		self:CICO(function()
		self.Damage = 35
		self.SetupType = DMG_ALWAYSGIB
		self.WeaponDamage = 35
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_ALWAYSGIB
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self.Fin = true
		self:PlaySequenceAndMove("tnn_cmb03_assassin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("LeeAttack",math.random(0.5,1))
		else
		self:SetCooldown("LeeAttack",math.random(2.5,4))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "tnn_cmb01powertrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 25
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("tnn_cmb02_power",1)
		end)
	end
	if e == "tnn_cmb02powertrans" then
		self:CICO(function()
		self.Damage = 35
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 35
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("tnn_cmb03_power",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("LeeAttack",math.random(0.5,1))
		else
		self:SetCooldown("LeeAttack",math.random(2.5,4))
		end
		self.Fin = false
		self.Tsuki = false
		self:AttackReset()
		end)
	end
	if e == "tam_cmb01atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb02_a",1)
		end)
	end
	if e == "tam_cmb02atrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("tam_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "tam_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb02_b",1)
		end)
	end
	if e == "tam_cmb02btrans" then
		self:CICO(function()
		self.Damage = 25
		if self.Normal then
			self.SetupType = DMG_ALWAYSGIB
		else
			self.SetupType = DMG_GENERIC
		end
		self:PlaySequenceAndMove("tam_cmb03_b",1)
		end)
	end
	if e == "tam_cmb03btrans" then
		self:CICO(function()
		if self.Normal then
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		self.Damage = 40
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("tam_cmb04_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end
		end)
	end
	if e == "tam_cmb01ctrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("tam_cmb02_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "tam_cmb01dtrans" then
		self:CICO(function()
		self.Damage = 30
		self.NoDown = true
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("tam_cmb02_d",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.NoDown = false
		self:AttackReset()
		end)
	end
	if e == "iha_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iha_cmb02_a",1)
		end)
	end
	if e == "iha_cmb02atrans" then
		self:CICO(function()
		if math.random(2)==1 then
		self.Damage = 25
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("iha_cmb03_a_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("iha_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "iha_cmb01btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("iha_cmb02_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "yah_cmb01atrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("yah_cmb02_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "yah_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("yah_cmb02_b",1)
		end)
	end
	if e == "yah_cmb02btrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("yah_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "rik_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("rik_cmb02_a",1)
		end)
	end
	if e == "rik_cmb02atrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("rik_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "rik_cmb01btrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("rik_cmb02_b",1)
		end)
	end
	if e == "rik_cmb02btrans" then
		self:CICO(function()
		self.Damage = 40
		self.BoundG = true
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("rik_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.BoundG = false
		self:AttackReset()
		end)
	end
	if e == "kuz_cmb01atrans" then
		self:CICO(function()
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kuz_cmb02_a",1)
		end)
	end
	if e == "kuz_cmb02atrans" then
		self:CICO(function()
		self.Damage = 35
		self.SetupType = DMG_NEVERGIB
		self:PlaySequenceAndMove("kuz_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KuzeAttack",math.random(0.5,1))
		else
		self:SetCooldown("KuzeAttack",math.random(2.5,4))
		end
		self:AttackReset()
		end)
	end
	if e == "kuz_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kuz_cmb02_b",1)
		end)
	end
	if e == "kuz_cmb02btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("kuz_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self:SetCooldown("KuzeAttack",math.random(2.5,4))
		self:AttackReset()
		end)
	end
	if e == "kuz_cmb01headbutttrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kuz_cmb02_headbutt",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KuzeAttack",math.random(0.5,1))
		else
		self:SetCooldown("KuzeAttack",math.random(2.5,4))
		end
		self:AttackReset()
		end)
	end
	if e == "kuz_cmb01rendatrans" then
		self:CICO(function()
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kuz_cmb02_renda_l",1)
		end)
	end
	if e == "kuz_cmb02rendaltrans" then
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 40
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("kuz_cmb02_renda_l_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KuzeAttack",math.random(0.5,1))
		else
		self:SetCooldown("KuzeAttack",math.random(2.5,4))
		end
		self:AttackReset()
		else
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kuz_cmb02_renda_r",1)
		end
		end)
	end
	if e == "kuz_cmb02rendartrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("kuz_cmb02_renda_r_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KuzeAttack",math.random(0.5,1))
		else
		self:SetCooldown("KuzeAttack",math.random(2.5,4))
		end
		self:AttackReset()
		end)
	end
	if e == "fat_bat_cmb01trans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("fat_bat_cmb02",1)
		end)
	end
	if e == "fat_bat_cmb02trans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_PHYSGUN
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("fat_bat_cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self.Fin = false
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "knd_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.NoDown = true
		self.SetupType = DMG_PEVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("knd_cmb02_b",1)
		self.NoDown = false
		end)
	end
	if e == "knd_cmb02btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self.NoDown = false
		self:PlaySequenceAndMove("knd_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "knd_cmb01atrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_FALL
		self.NoDown = false
		self:PlaySequenceAndMove("knd_cmb02_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "dgo_cmb01trans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("dgo_cmb02",1)
		end)
	end
	if e == "dgo_cmb02trans" then
		self:CICO(function()
		if math.random(2)==1 then
		self.Damage = 30
		self.SetupType = DMG_DIRECT
		self.NoDown = false
		self:PlaySequenceAndMove("dgo_cmb03_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("dgo_cmb03",1)
		end
		end)
	end
	if e == "dgo_cmb03trans" then
		self:CICO(function()
		if self.Ryu0 or not self.Boss then
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		if math.random(3)==2 then
		self.Damage = 30
		self.NoDown = true
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("dgo_cmb04_upper",1)
		self.NoDown = false
		else
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("dgo_cmb04",1)
		end
		end
		end)
	end
	if e == "dgo_cmb04uppertrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_NEVERGIB
		self.NoDown = false
		self:PlaySequenceAndMove("dgo_cmb05_chop",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "dgo_cmb04trans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_AIRBOAT
		self.NoDown = false
		self:PlaySequenceAndMove("dgo_cmb05_heavy",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "iwa_cmb01atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iwa_cmb02_a",1)
		end)
	end
	if e == "iwa_cmb02atrans" then
		self:CICO(function()
		if self.Ryu0 or not self.Boss then
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		else
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iwa_cmb03_a",1)
		end
		end)
	end
	if e == "iwa_cmb03atrans" then
		self:CICO(function()
		local attack = math.random(3)
		if attack==1 then
		self.Damage = 25
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("iwa_cmb04_a_low_01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		elseif attack==2 then
		self.Damage = 20
		self.NoDown = true
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("iwa_cmb04_a_fake2low_01",1)
		self.NoDown = false
		else
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iwa_cmb04_a",1)
		end
		end)
	end
	if e == "iwa_cmb04atrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("iwa_cmb05_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "iwa_cmb04afake2lowtrans" then
		self:CICO(function()
		self.Damage = 30
		self.NoDown = false
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("iwa_cmb04_a_fake2low_02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "iwa_cmb01btrans" then
		self:CICO(function()
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iwa_cmb02_b_mid",1)
		end)
	end
	if e == "iwa_cmb02btrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("iwa_cmb03_b_mid",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "sai_cmb01atrans" then
		self:CICO(function()
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 10
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb02_a",1)
		end)
	end
	if e == "sai_cmb02atrans" then
		self:CICO(function()
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 15
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb03_a",1)
		end)
	end
	if e == "sai_cmb03atrans" then
		self:CICO(function()
		if math.random(2)==1 then
			self.Damage = 35
			self.SetupType = DMG_DIRECT
			self.WeaponDamage = 35
			if self.WeaponType == 0 then
				self.WeaponDamageType = DMG_DIRECT
			elseif self.WeaponType == 1 then
				self.WeaponDamageType = DMG_DIRECT
			elseif self.WeaponType == 2 then
				self.WeaponDamageType = DMG_SHOCK
			elseif self.WeaponType == 3 then
				self.WeaponDamageType = DMG_POISON
			elseif self.WeaponType == 4 then
				self.WeaponDamageType = DMG_BLAST
			end
			self:PlaySequenceAndMove("sai_cmb04_a_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			if self.Angr or self.Heat then
			self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
			else
			self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
			end
			self:AttackReset()
		else
			self.Damage = 25
			self.SetupType = DMG_GENERIC
			self.WeaponDamage = 25
			if self.WeaponType == 0 then
				self.WeaponDamageType = DMG_GENERIC
			elseif self.WeaponType == 1 then
				self.WeaponDamageType = DMG_SLASH
			elseif self.WeaponType == 2 then
				self.WeaponDamageType = DMG_SHOCK
			elseif self.WeaponType == 3 then
				self.WeaponDamageType = DMG_POISON
			elseif self.WeaponType == 4 then
				self.WeaponDamageType = DMG_BLAST
			end
			self:PlaySequenceAndMove("sai_cmb04_a",1)
		end
		end)
	end
	if e == "sai_cmb04atrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_PHYSGUN
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb05_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "sai_cmb01btrans" then
		self:CICO(function()
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 10
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb02_b",1)
		end)
	end
	if e == "sai_cmb02btrans" then
		self:CICO(function()
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 15
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb03_b",1)
		end)
	end
	if e == "sai_cmb03btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 25
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb04_b",1)
		end)
	end
	if e == "sai_cmb04btrans" then
		self:CICO(function()
		if math.random(2)==1 then
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_ALWAYSGIB
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb05_b_upper",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_PHYSGUN
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("sai_cmb05_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "pow_cmb01atrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("pow_cmb02_a",1)
		end)
	end
	if e == "pow_cmb02atrans" then
		self:CICO(function()
		self.Damage = 60
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("pow_cmb03_a",1)
		end)
	end
	if e == "pow_cmb03atrans" then
		self:CICO(function()
		self.Damage = 75
		self.Fin = true
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("pow_cmb04_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "pow_cmb01btrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("pow_cmb02_b",1)
		end)
	end
	if e == "pow_cmb02btrans" then
		self:CICO(function()
		self.Damage = 75
		self.SetupType = DMG_SLASH
		self:PlaySequenceAndMove("pow_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "batton_cmb01trans" then
		self:CICO(function()
		self.Damage = 30
		self.Fin = true
		self.SetupType = DMG_FALL
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("batton_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "stool_cmb01trans" then
		self:CICO(function()
		self.Damage = 30
		self.Fin = true
		self.SetupType = DMG_FALL
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_FALL
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("stool_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "dat_cmb01trans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("dat_cmb02",1)
		end)
	end
	if e == "dat_cmb02trans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("dat_cmb03",1)
		end)
	end
	if e == "dat_cmb03trans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("dat_cmb04",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "lee_cmb01atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("lee_cmb02_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "lee_cmb01btrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_VEHICLE
		self:PlaySequenceAndMove("lee_cmb02_b_miss",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "golf_cmb01atrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("golf_cmb02_a",1)
		end)
	end
	if e == "golf_cmb02atrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_AIRBOAT
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_AIRBOAT
		elseif self.WeaponType == 1 then
			self.Fin = true
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("golf_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self.Fin = false
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "golf_cmb01btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("golf_cmb02_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "oda_cmb01anikitrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 20
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb02_aniki",1)
		end)
	end
	if e == "oda_cmb02anikitrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb03_aniki",1)
		end)
	end
	if e == "oda_cmb03anikitrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_AIRBOAT
		self.Fin = true
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_AIRBOAT
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb04_aniki",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "oda_cmb01blowtrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 20
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb02_blow",1)
		end)
	end
	if e == "oda_cmb02blowtrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 30
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb03_blow",1)
		end)
	end
	if e == "oda_cmb03blowtrans" then
		self:CICO(function()
		self.Damage = 40
		self.Fin = true
		self.SetupType = DMG_SLASH
		self.WeaponDamage = 40
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_SONIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("oda_cmb04_blow",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self.Fin = false
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "kaz_cmb01atrans" then
		self:CICO(function()
		if math.random(2)==1 then
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kaz_cmb02_a2",1)
		else
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kaz_cmb02_a",1)
		end
		end)
	end
	if e == "kaz_cmb02atrans" then
		self:CICO(function()
		if math.random(2)==1 then
		self.Damage = 40
		self.SetupType = DMG_DIRECT
		self:PlaySequenceAndMove("kaz_cmb03_a1",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self.SetupType = DMG_ALWAYSGIB
		self:PlaySequenceAndMove("kaz_cmb03_a",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		end
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "kaz_cmb02a2trans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("kaz_cmb03_a2",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "kaz_cmb01btrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kaz_cmb02_b",1)
		end)
	end
	if e == "kaz_cmb02btrans" then
		self:CICO(function()
		self.Damage = 60
		self.SetupType = DMG_VEHICLE
		self:PlaySequenceAndMove("kaz_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "kaz_cmb01ctrans" then
		self:CICO(function()
		self.Damage = 30
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("kaz_cmb02_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "ric_cmb01atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb02_a",1)
		end)
	end
	if e == "ric_cmb02atrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb03_a",1)
		end)
	end
	if e == "ric_cmb03atrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("ric_cmb04_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "ric_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("ric_cmb02_b",1)
		end)
	end
	if e == "ric_cmb03btrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("ric_cmb03_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "ric_cmb01ctrans" then
		self:CICO(function()
		self.Damage = 50
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("ric_cmb02_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "ric_cmb01sptrans" then
		self:CICO(function()
		self.Damage = 10
		self.RICSP = true
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("ric_cmb02_sp_miss",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.RICSP = false
		self:AttackReset()
		end)
	end
	if e == "gun_b_cmb01trans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("gun_b_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "wpg_cmb01trans" then
		self:CICO(function()
		self.Damage = 85
		self.SetupType = DMG_GENERIC
		self.WeaponDamage = 85
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_GENERIC
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("wpg_cmb02",1)
		end)
	end
	if e == "wpg_cmb02trans" then
		self:CICO(function()
		self.Damage = 100
		self.Fin = true
		self.SetupType = DMG_NEVERGIB
		self.WeaponDamage = 100
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_NEVERGIB
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("wpg_cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "wpg_hammer_cmb01trans" then
		self:CICO(function()
		self.Damage = 100
		self.Fin = true
		self.SetupType = DMG_VEHICLE
		self.WeaponDamage = 100
		if self.WeaponType == 0 then
			self.WeaponDamageType = DMG_VEHICLE
		elseif self.WeaponType == 1 then
			self.WeaponDamageType = DMG_SLASH
		elseif self.WeaponType == 2 then
			self.WeaponDamageType = DMG_SHOCK
		elseif self.WeaponType == 3 then
			self.WeaponDamageType = DMG_POISON
		elseif self.WeaponType == 4 then
			self.WeaponDamageType = DMG_BLAST
		end
		self:PlaySequenceAndMove("wpg_hammer_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self.Fin = false
		self:AttackReset()
		end)
	end
	if e == "gng_cmb01trans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("gng_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "cap_cmb01atrans" then
		self:CICO(function()
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb02_a",1)
		end)
	end
	if e == "cap_cmb02atrans" then
		self:CICO(function()
		self.Damage = 40
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("cap_cmb03_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "cap_cmb01btrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cap_cmb02_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "cap_cmb01dodgeltrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("cap_cmb02_dodge_l",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "cap_cmb01dodgertrans" then
		self:CICO(function()
		self.Damage = 25
		self.SetupType = DMG_CRUSH
		self:PlaySequenceAndMove("cap_cmb02_dodge_r",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
		self:AttackReset()
		end)
	end
	if e == "nope2st" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove(self.SyncCounterLoopAnimation,1)
		end)
	end
	if e == "nope2lp" then
		self:CICO(function()
		if self.Loops == 1 then
		self:PlaySequenceAndMove(self.SyncCounterEndAnimation,1)
		else
		self.Loops = math.min(1,self.Loops + 1)
		self:PlaySequenceAndMove(self.SyncCounterLoopAnimation,1)
		end
		end)
	end
	if e == "nope2on" then
		self.SyncCounter = true
	end
	if e == "nope2off" then
		self.SyncCounter = false
	end
	if e == "ygrabst" then
		if IsValid(self.Target) then
		local ent = self.Target
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent.Loops = 0
		ent.Grabbed = true
		ent:PlaySequenceAndMove("yop_grab_f_lp_sync1")
		end)
		end
		self:CICO(function()
		self.Damage = 25
		self.Loops = 0
		self:PlaySequenceAndMove("yop_grab_f_lp_sync",1)
		end)
	end
	if e == "ygrablp" then
		if IsValid(self.Target) then
		local ent = self.Target
		ent:CICO(function(ent)
		if ent.Loops == 2 then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		self.Target.Grabbed = false
		self.Target.Grabber = nil
		ent:PlaySequenceAndMove("yop_grab_f_en_sync1")
		else
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent.Loops = math.min(2,ent.Loops + 1)
		ent:PlaySequenceAndMove("yop_grab_f_lp_sync1")
		end
		end)
		end
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("yop_grab_f_en_sync",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("yop_grab_f_lp_sync",1)
		end
		end)
	end
	if e == "iwa_necklock_st" then
		if IsValid(self.Target) then
		local ent = self.Target
		ent:CICO(function(ent)
		ent.Loops = 0
		ent.Grabbed = true
		ent:PlaySequenceAndMove("iwa_necklock_lp_sync1")
		end)
		end
		self:CICO(function()
		self.Damage = 25
		self.Loops = 0
		self:PlaySequenceAndMove("iwa_necklock_lp_sync",1)
		end)
	end
	if e == "iwa_necklock_lp" then
		if IsValid(self.Target) then
		local ent = self.Target
		ent:CICO(function(ent)
		if ent.Loops == 2 then
		self.Target.Grabbed = false
		self.Target.Grabber = nil
		ent:PlaySequenceAndMove("iwa_necklock_en_sync1")
		else
		ent.Loops = math.min(2,ent.Loops + 1)
		ent:PlaySequenceAndMove("iwa_necklock_lp_sync1")
		end
		end)
		end
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("iwa_necklock_en_sync",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("iwa_necklock_lp_sync",1)
		end
		end)
	end
	if e == "throw_knife" then
		if self.ThrowKnife then
			if IsValid(self.Weapon) then
				self.Weapon:Remove()
			end
		self:CallInCoroutine(function()
			if self.ThrowKnife then
			self:PlaySequenceAndMove("atk_knife_throw_st",1,self.FaceEnemy)
			end
		end)
		end
		self.Laser = self:CreateProjectile(nil, {}, "obj_yakuza_dart")
		self.Laser:SetPos(self:GetAttachment(3).Pos)
		self.Laser:SetAngles(self:GetAngles())
		self.Laser:SetNoDraw(true)
		ParticleEffectAttach("dart_trail",PATTACH_POINT_FOLLOW,self.Laser,0)
		self.Laser:SetModelScale(0.2,0.01)
		if !self:IsPossessed() and IsValid(self:GetEnemy()) then
			self.Laser:AimAt(self:GetEnemy(), 1000)
		elseif self:IsPossessed() then
			local lockedOn = self:PossessionGetLockedOn()
			if IsValid(lockedOn) then 
				self.Laser:AimAt(lockedOn,1000)
			else
				self.Laser:AimAt(self:PossessorTrace().HitPos,900)
			end
		end
	end
	if e == "throw_bomb" then
		if self.ThrowBomb then
			if IsValid(self.Weapon) then
				self.Weapon:Remove()
			end
		self:CallInCoroutine(function()
			if self.ThrowBomb then
			self:PlaySequenceAndMove("atk_bomb_throw_st",1,self.FaceEnemy)
			end
		end)
		end
		self.Laser = self:CreateProjectile(nil, {}, "obj_yakuza_handgrenade")
		self.Laser:SetPos(self:GetAttachment(3).Pos)
		self.Laser:SetAngles(self:GetAngles())
		ParticleEffectAttach("dart_trail",PATTACH_POINT_FOLLOW,self.Laser,0)
		local phys = self.Laser:GetPhysicsObject()
		phys:AddAngleVelocity( Vector( math.random(500,-500), math.random(500,-500), math.random(500,-500) ) )
		if !self:IsPossessed() and IsValid(self:GetEnemy()) then
			self.Laser:AimAt(self:GetEnemy(), 600)
		elseif self:IsPossessed() then
			local lockedOn = self:PossessionGetLockedOn()
			if IsValid(lockedOn) then 
				self.Laser:AimAt(lockedOn,600)
			else
				self.Laser:AimAt(self:PossessorTrace().HitPos,600)
			end
		end
	end
	if e == "pain" then
		if #self.PainSounds > 0 then
			self:EmitSound(self.PainSounds[math.random(#self.PainSounds)])
		end
	end
	if e == "painh" then
		if #self.PainHeadSounds > 0 then
			self:EmitSound(self.PainHeadSounds[math.random(#self.PainHeadSounds)])
		end
	end
	if e == "painb" then
		if #self.PainBodySounds > 0 then
			self:EmitSound(self.PainBodySounds[math.random(#self.PainBodySounds)])
		end
	end
	if e == "painhl" then
		if #self.PainHeadLSounds > 0 then
			self:EmitSound(self.PainHeadLSounds[math.random(#self.PainHeadLSounds)])
		end
		if IsValid(self.GlassPos) and not self.Downed then
		self:GlassesFall()
		end
	end
	if e == "painbl" then
		if #self.PainBodyLSounds > 0 then
			self:EmitSound(self.PainBodyLSounds[math.random(#self.PainBodyLSounds)])
		end
		if IsValid(self.GlassPos) and not self.Downed then
		self:GlassesFall()
		end
	end
	if e == "painxl" then
		if #self.PainXLSounds > 0 then
			self:EmitSound(self.PainXLSounds[math.random(#self.PainXLSounds)])
		end
		if IsValid(self.GlassPos) and not self.Downed then
		self:GlassesFall()
		end
	end
	if e == "tubazeri" then
		if #self.TubazeriSounds > 0 then
			self:EmitSound(self.TubazeriSounds[math.random(#self.TubazeriSounds)])
		end
	end
	if e == "stand" then
		if #self.StandSounds > 0 then
			self:EmitSound(self.StandSounds[math.random(#self.StandSounds)])
		end
	end
	if e == "attacks" then
		if #self.AttackSmallSounds > 0 then
			self:EmitSound(self.AttackSmallSounds[math.random(#self.AttackSmallSounds)])
		end
	end
	if e == "attackl" then
		if #self.AttackLargeSounds > 0 then
			self:EmitSound(self.AttackLargeSounds[math.random(#self.AttackLargeSounds)])
		end
	end
	if e == "attackxl" then
		if #self.AttackXLSounds > 0 then
			self:EmitSound(self.AttackXLSounds[math.random(#self.AttackXLSounds)])
		end
	end
	if e == "angry" then
		if #self.AngrySounds > 0 then
			self:EmitSound(self.AngrySounds[math.random(#self.AngrySounds)])
		end
	end
	if e == "fear" then
		if #self.FearSounds > 0 then
			self:EmitSound(self.FearSounds[math.random(#self.FearSounds)])
		end
	end
	if e == "throw" then
		if #self.ThrowSounds > 0 then
			self:EmitSound(self.ThrowSounds[math.random(#self.ThrowSounds)])
		end
	end
	if e == "provo" then
		if #self.ProvokeSounds > 0 then
			self:EmitSound(self.ProvokeSounds[math.random(#self.ProvokeSounds)])
		end
	end
	if e == "vanish" then
		if #self.VanishSounds > 0 then
			self:EmitSound(self.VanishSounds[math.random(#self.VanishSounds)])
		end
	end
	if e == "suprise" then
		if #self.SupriseSounds > 0 then
			self:EmitSound(self.SupriseSounds[math.random(#self.SupriseSounds)])
		end
	end
	if e == "hey_you_whats_up_man" then
		self:EmitSound("yakuza0/goons/hey_you_whats_up_man1.wav",85)
	end
	if e == "give_me_money_please" then
		self:EmitSound("yakuza0/goons/give_me_money_please1.wav",85)
	end
	if e == "ydrinkst" then
		self:CICO(function()
		self.Loops = 0
		self:SetHealth(self:Health()+5)
		self:EmitSound("yakuza0/drink.wav",75,80)
		self:PlaySequenceAndMove("yop_drink_lp",1)
		end)
	end
	if e == "ydrinklp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:SetHealth(self:Health()+5)
		if not self.Angr then
		self.Angr = true
		if IsValid(self:GetEnemy()) then
		self:AddEntityRelationship( self:GetEnemy(), D_HT, 2 )
		end
		end
		self:PlaySequenceAndMove("yop_drink_en",1)
		self:AttackReset()
		else
		self.Damage = 25
		self.Loops = math.min(2,self.Loops + 1)
		self:SetHealth(self:Health()+5)
		self:EmitSound("yakuza0/drink.wav",75,80)
		self:PlaySequenceAndMove("yop_drink_lp",1)
		end
		end)
	end
	if e == "draw" then
		self:DrawWeapon()
	end
	if e == "disarmed" or e == "drop" then
		if IsValid(self.Weapon) and not (self.CantDisarm and not self.Yop) then
			self.Weapon:Remove()
			if not self.Yop then
			if self.JkS then
			self.Jak = true
			else
			self.Normal = true
			end
			self.JkS = false
			self.Knife = false
			self.Gun = false
			self:Stance()
			end
		end
	end
	if e == "shot" then
		self.Attacking = false
		self.Swinging = false
		if IsValid(self.Weapon) then
		self:EmitSound("yakuza0/weapons/gun/gunshot1.wav",80,100,0.75)
		self.Laser = self:CreateProjectile(nil, {}, "obj_yakuza_bigbullet")
		self.Laser:SetPos(self.Weapon:GetAttachment(1).Pos)
		self.Laser:SetAngles(self:GetAngles())
		self.Laser:SetNoDraw(true)
		ParticleEffectAttach("ishin_bullet_trail",PATTACH_POINT_FOLLOW,self.Laser,0)
		self.Laser:SetModelScale(0.2,0.01)
		self.Laser:AimAt(self.Weapon:GetAttachment(1).Pos,2000)
		end
	end
	if e == "smgshot" then
		self.Attacking = false
		self.Swinging = false
		if IsValid(self.Weapon) then
		self:EmitSound("yakuza0/weapons/gayagun/gunshot1.wav",80,100,0.75)
		if not IsValid(self.Corrector) then
		self.Corrector = ents.Create("prop_physics")
		self.Corrector:SetModel("models/props_lab/huladoll.mdl")
		self.Corrector:Spawn()
		self.Corrector:SetNotSolid(true)
		self.Corrector:SetNoDraw(true)
		self.Corrector:SetParent(self.Weapon)
		self.Corrector:Fire("setparentattachment","wpn_r")
		self.Corrector2 = ents.Create("prop_physics")
		self.Corrector2:SetModel("models/props_lab/huladoll.mdl")
		self.Corrector2:Spawn()
		self.Corrector2:SetNotSolid(true)
		self.Corrector2:SetNoDraw(true)
		self.Corrector2:SetParent(self.Corrector)
		self.Corrector2:SetPos(self.Corrector2:GetPos()+self.Corrector2:GetUp()*20+self.Corrector2:GetForward()*6+self.Corrector2:GetRight()*-3)
		self.Corrector2:SetAngles(self.Corrector2:GetAngles()+Angle(0,0,0))
		end
		self.Laser = self:CreateProjectile(nil, {}, "obj_yakuza_sbullet")
		self.Laser:SetPos(self:GetAttachment(3).Pos)
		self.Laser:SetAngles(self.Corrector:GetAngles())
		self.Laser:SetNoDraw(true)
		ParticleEffectAttach("ishin_bullet_trail",PATTACH_POINT_FOLLOW,self.Laser,0)
		self.Laser:SetModelScale(0.2,0.01)
		self.Laser:AimAt(self.Corrector2:GetPos(),2000)
		end
	end
	if e == "cock" then
		self:EmitSound("yakuza0/weapons/gun/gun_parts.wav",100)
	end
	if e == "shottyshot" then
		self.Attacking = false
		self.Swinging = false
		if IsValid(self.Weapon) then
		self:EmitSound("yakuza0/weapons/shotgun/gunshot.wav",80,100,0.75)
		self.Laser = self:CreateProjectile(nil, {}, "obj_yakuza_bigbullet")
		self.Laser:SetPos(self.Weapon:GetAttachment(2).Pos)
		self.Laser:SetAngles(self:GetAngles())
		self.Laser:SetNoDraw(true)
		ParticleEffectAttach("ishin_bullet_trail",PATTACH_POINT_FOLLOW,self.Laser,0)
		self.Laser:SetModelScale(0.2,0.01)
		self.Laser:AimAt(self.Weapon:GetAttachment(2).Pos,2000)
		end
	end
	if e == "shottycock" then
		self:EmitSound("yakuza0/weapons/shotgun/reload.wav")
	end
	if e == "clap" then
		self:EmitSound("yakuza0/clap"..math.random(4)..".wav")
	end
	if e == "knuck" then
		self:EmitSound("weapons/fists/hit"..math.random(4)..".wav")
	end
	if e == "knee" then
		self:EmitSound("common/body"..math.random(1,2,3)..".wav")
	end
		if e == "body" then
		self:EmitSound("common/body"..math.random(4,5,6)..".wav")
	end
	if e == "bodyl" then
		self:EmitSound("common/body"..math.random(7,8,9)..".wav")
	end
	if e == "bone" then
		self:EmitSound("common/bone"..math.random(2)..".wav")
	end
	if e == "downstandupb1" then
		self:CICO(function()
		self.Downed = false
		self.Downing = false
		self:PlaySequenceAndMove("down_standup_b_dn",1)
		end)
	end
	if e == "downstandupb2" then
		self:CICO(function()
		self.Dodge = false
		self:PlaySequenceAndMove("down_standup_b_en",1)
		end)
	end
	if e == "downstandupf1" then
		self:CICO(function()
		self.Downed = false
		self.Downing = false
		self:PlaySequenceAndMove("down_standup_f_dn",1)
		end)
	end
	if e == "downstandupf2" then
		self:CICO(function()
		self.Dodge = false
		self:PlaySequenceAndMove("down_standup_f_en",1)
		end)
	end
	if e == "downstandupr1" then
		self:CICO(function()
		self.Downed = false
		self.Downing = false
		self:PlaySequenceAndMove("down_standup_r_dn",1)
		end)
	end
	if e == "downstandupr2" then
		self:CICO(function()
		self.Dodge = false
		self:PlaySequenceAndMove("down_standup_r_en",1)
		end)
	end
	if e == "downstandupl1" then
		self:CICO(function()
		self.Downed = false
		self.Downing = false
		self:PlaySequenceAndMove("down_standup_l_dn",1)
		end)
	end
	if e == "downstandupl2" then
		self:CICO(function()
		self.Dodge = false
		self:PlaySequenceAndMove("down_standup_l_en",1)
		end)
	end
	if e == "downfatalbst" then
		self:CICO(function()
		self:PlaySequenceAndMove("down_fatal_b_en",1)
		end)
	end
	if e == "downfatalfst" then
		self:CICO(function()
		self:PlaySequenceAndMove("down_fatal_f_en",1)
		if self:IsDead() then
		self:PlaySequenceAndMove("death"..math.random(5),1)
		end
		end)
	end
	if e == "downf" then
		self:CICO(function()
		if self.Angr then
		self:AddEntityRelationship( self:GetEnemy(), D_HT, 1 )
		self.Angr = false
		end
		self.WBProtection = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Back = false
		self.Front = true
		self:Extinguish()
		if self:IsDead() then
		self:PlaySequenceAndMove("down_f_death"..math.random(4),1)
		SafeRemoveEntityDelayed(self,60)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:PauseCoroutine(false)
		else
		if (self.DFlinches > 5 and math.random(2)==1 or self.Boss and self.DFlinches > 1 and math.random(2)==1) or self.DFlinches > 10 or self:GetCooldown("DownFlinch")!=0 or self.Heat or self.Hide then
		self:SetCooldown("DownFlinch",2)
		if self.Heat or self.DFlinches > 3 or self.Hide then
		self:PlaySequenceAndMove("standup_f2",1)
		elseif self.Mnm and math.random(2)==1 then
		self:PlaySequenceAndMove("mnm_standup_f_spring",1,self.FaceEnemy)
		else
		self:PlaySequenceAndMove("standup_f1",1)
		end
		self.DFlinches = 0
		self.StandingUp = false
		else
		if self.HeadPain and not self.CantWhine then
		self.HeadPain = false
		self:PlaySequenceAndMove("down_f_pain_head_st",1)
		elseif self.BodyPain and self.CanWhine then
		self.BodyPain = false
		self:PlaySequenceAndMove("down_f_pain_body_st",1)
		elseif self.LegPain and self.CanWhine then
		self.LegPain = false
		self:PlaySequenceAndMove("down_f_pain_leg_st",1)
		else
		self.DFlinches = math.min(12,self.DFlinches + 1)
		self:PlaySequenceAndMove("down_f",1)
		end
		end
		end
		end)
	end
	if e == "downb" then
		self:CICO(function()
		if self.Angr then
		self:AddEntityRelationship( self:GetEnemy(), D_HT, 1 )
		self.Angr = false
		end
		self.WBProtection = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Front = false
		self.Back = true
		self:Extinguish()
		if self:IsDead() then
		self:PlaySequenceAndMove("down_b_death"..math.random(4),1)
		SafeRemoveEntityDelayed(self,60)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:PauseCoroutine(false)
		else
		if (self.DFlinches > 5 and math.random(2)==1) or self.DFlinches > 10 or self:GetCooldown("DownFlinch")!=0 or self.Heat or self.Hide then
		self:SetCooldown("DownFlinch",2)
		if self.Heat or self.DFlinches > 3 or self.Hide then
		self:PlaySequenceAndMove("standup_b2",1)
		else
		self:PlaySequenceAndMove("standup_b1",1)
		end
		self.DFlinches = 0
		self.StandingUp = false
		else
		if self.HeadPain and not self.CantWhine then
		self.HeadPain = false
		self:PlaySequenceAndMove("down_b_pain_head_st",1)
		elseif self.BodyPain and self.CanWhine then
		self.BodyPain = false
		self:PlaySequenceAndMove("down_b_pain_body_st",1)
		elseif self.LegPain and self.CanWhine then
		self.LegPain = false
		self:PlaySequenceAndMove("down_b_pain_leg_st",1)
		else
		self.DFlinches = math.min(12,self.DFlinches + 1)
		self:PlaySequenceAndMove("down_b",1)
		end
		end
		end
		end)
	end
	if e == "painlegbst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_b_pain_leg_lp",1)
		end)
	end
	if e == "painlegblp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_b_pain_leg_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_b_pain_leg_lp",1)
		end
		end)
	end
	if e == "painbodybst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_b_pain_body_lp",1)
		end)
	end
	if e == "painbodyblp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_b_pain_body_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_b_pain_body_lp",1)
		end
		end)
	end
	if e == "painheadbst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_b_pain_head_lp",1)
		end)
	end
	if e == "painheadblp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_b_pain_head_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_b_pain_head_lp",1)
		end
		end)
	end
	if e == "painlegfst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_f_pain_leg_lp",1)
		end)
	end
	if e == "painlegflp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_f_pain_leg_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_f_pain_leg_lp",1)
		end
		end)
	end
	if e == "painbodyfst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_f_pain_body_lp",1)
		end)
	end
	if e == "painbodyflp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_f_pain_body_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_f_pain_body_lp",1)
		end
		end)
	end
	if e == "painheadfst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("down_f_pain_head_lp",1)
		end)
	end
	if e == "painheadflp" then
		self:CICO(function()
		if self.Loops == 2 then
		self:PlaySequenceAndMove("down_f_pain_head_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("down_f_pain_head_lp",1)
		end
		end)
	end
	if e == "stunbodyst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("piyori_head_f_lp",1)
		end)
	end
	if e == "stunbodylp" then
		self:CICO(function()
		if self.Loops == 2 then
		self.Stunned = false
		self:PlaySequenceAndMove("piyori_head_f_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("piyori_head_f_lp",1)
		end
		end)
	end
	if e == "stunheadst" then
		self:CICO(function()
		self.Loops = 0
		self:PlaySequenceAndMove("piyori_head_f_lp",1)
		end)
	end
	if e == "stunheadlp" then
		self:CICO(function()
		if self.Loops == 2 then
		self.Stunned = false
		self:PlaySequenceAndMove("piyori_head_f_en",1)
		else
		self.Loops = math.min(2,self.Loops + 1)
		self:PlaySequenceAndMove("piyori_head_f_lp",1)
		end
		end)
	end
	if e == "atk_on" then
		self:CICO(function()
			self.Attacking = true
		end)
	end
	if e == "atk_off" then
		self:CICO(function()
			self.Attacking = false
		end)
	end
	if e == "nododge_on" then
		self:CICO(function()
			self.CantDodge = true
		end)
	end
	if e == "nododge_off" then
		self:CICO(function()
			self.CantDodge = false
		end)
	end
	if e == "swinging_on" then
		self:CICO(function()
			self.Swinging = true
		end)
	end
	if e == "swinging_off" then
		self:CICO(function()
			self.Swinging = false
		end)
	end
	if e == "down_air" then
		if self.CanAntidown then
		if not self:IsDead() and math.random(1)==1 then
		self:CICO(function()
		self.Downing = false
		self.Attacking = true
		self.Damage = 50
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("atk_antidown_f",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self.Attacking = false
		end)
		end
		end
	end
	if e == "down_st" then
	self.Downing = true
	end
	if e == "down_en" then
	self.Downing = false
	self.Downed = true
	end
	if e == "stand_st" then
	self.Downed = false
	self.StandingUp = true
	if self:Health() < self:GetMaxHealth()/2 and math.random(3)==1 then
	self:Angery()
	end
	end
	if e == "stand_en" then
	self.StandingUp = false
	end
	if e == "down_ft" then
	self.Back = false
	self.Front = true
	end
	if e == "down_bk" then
	self.Front = false
	self.Back = true
	end
	if e == "wallbound" then
		self:CICO(function()
		self.WBSafety = false
		if self.WBProtection then
		self.WallDam = 5
		else
		self.WallDam = 10
		end
		self.WBProtection = true
		local d = DamageInfo()
		d:SetDamage( self.WallDam )
		if IsValid(self.Attacker) then
			d:SetAttacker( self.LastAttacker ) 
		else
			d:SetAttacker( self ) 
		end
		d:SetDamageType( DMG_MISSILEDEFENSE ) 
		self:TakeDamageInfo( d )
		end)
	end
	if e == "katsuage_cam1" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(43+5,0.5,self)
		end
	end
	if e == "katsuage_cam2" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(46.7+5,1,self)
		end
	end
	if e == "big_cam1" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(46.7+5,0.5,self)
		end
	end
	if e == "big_cam2" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(43+5,0,self)
		end
	end
	if e == "big_cam3" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(46.7+5,1,self)
		end
	end
	if e == "bat_cam1" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(46.7+5,0.5,self)
		end
	end
	if e == "bat_cam2" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(36+5,0,self)
		end
	end
	if e == "bat_cam3" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(43+5,0,self)
		self.enemyplayer:SetFOV(50.5+5,3,self)
		end
	end
	if e == "ypp_cam1" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(43+5,0.5,self)
		end
	end
	if e == "ypp_cam2" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(36+5,0,self)
		end
	end
	if e == "ypp_cam3" then
		if IsValid(self.enemyplayer) then
		self.enemyplayer:SetFOV(46.7+5,0,self)
		end
	end
	if e == "face_calm" then
		self:ResetFace()
		self.FCalm = true
	end
	if e == "face_angry" then
		self:ResetFace()
		self.Angry = true
	end
	if e == "face_angry2" then
		self:ResetFace()
		self.Angry2 = true
	end
	if e == "face_angry3" then
		self:ResetFace()
		self.Angry3 = true
	end
	if e == "face_pain" then
		self:ResetFace()
		self.Pain = true
	end
	if e == "face_pain2" then
		self:ResetFace()
		self.Pain2 = true
	end
	if e == "face_pain3" then
		self:ResetFace()
		self.Pain3 = true
	end
	if e == "face_fear" then
		self:ResetFace()
		self.Fear = true
	end
	if e == "face_shock" then
		self:ResetFace()
		self.Shocked = true
	end
end
function ENT:ShouldRun() 
	if IsValid(self:GetEnemy()) then
	if self:Visible(self:GetEnemy()) then
	return self:HasEnemy() and not self:IsInRange(self:GetEnemy(),self.RangeAttackRange*1)
	else
	return self:HasEnemy() and not self:Visible(self:GetEnemy())
	end
	end
end
function ENT:OnOtherKilled(ent, dmg)
	if ent:IsNextBot() and self.Combat then
		if string.find(ent:GetClass(), "drg_scot_*") and self:Visible(ent) and ent:IsInFaction("FACTION_YAKUZA") and self:IsInFaction("FACTION_YAKUZA") and GetConVarNumber("drg_yakuza_ff") == 0 then
			if math.random(4)==2 then
			self:Feare()
			end
		end
	end
end
function ENT:Feare(enemy)
	if self.Boss then return end
	if not self.Que then
	self.Que = true
	self:SetCooldown("GoonAttack",math.random(10,15))
	self:CallInCoroutine(function(self)
	self.Angr = false
	self.Fearme = true
	if IsValid(self.Weapon) then
		if self.Bat or self.FBat or self.Golf then
			self:PlaySequenceAndMove("fear"..math.random(4),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		elseif self.Gun or self.Smg or self.Shotgun or self.GunB or self.RicGun then
			self:PlaySequenceAndMove("fear",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
			self:PlaySequenceAndMove("fear"..math.random(4),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end
	else
		self:PlaySequenceAndMove("fear"..math.random(4),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	self.Fearme = false
	self.Que = false
	end)
	end
end
function ENT:Unconceal()
	if math.random(3)==2 then
	self.Knife2 = true
	else
	self.Knife = true
	end
	self.Normal = false
	self.Box = false
	self.KBox = false
	self.Tackle = false
	self.Karate = false
	self.Sir = false
	self.inf = false
	self.Iha = false
	self.Fat = false
	self.Gor = false
	self.Aiz = false
	self.Tam = false
	self.Knd = false
	self.Fat = false
	self.Msk = false
	self.Gor = false
	self.Mnm = false
	self.Judo = false
	self.Rik = false
	self.Yah = false
	self.Cpr = false
	self.ConcealKnife = false
end
function ENT:Angery(enemy)
	if self.Boss then return end
	if not self.Angr and not self.AQue then
	self.AQue = true
	local enemy = self:GetEnemy()
	self:CallInCoroutine(function(self)
	self.AQue = false
	self.Angr = true
	self:AddEntityRelationship( enemy, D_HT, 2 )
	self:SetCooldown("GoonAttack",0)
	self:PlaySequenceAndMove("angry"..math.random(3),1,self.FaceEnemy)
	if self.ConcealKnife and not IsValid(self.Weapon) then
	self:Unconceal()
	self.WeaponType = 1
	if self.Dosu then
		self.WeaponModel = 0
	else
		self.WeaponModel = math.random(10,12)
	end
	self.WeaponGuardSounds = {"yakuza0/weapons/dosu/guard.wav"}
	self.WeaponSwingSounds = {"yakuza0/weapons/dosu/swing1.wav","yakuza0/weapons/dosu/swing2.wav"}
	self.WeaponHitSounds = {"yakuza0/weapons/dosu/hit1.wav","yakuza0/weapons/dosu/hit2.wav"}
	self:PlaySequenceAndMove("knife_battou",1,self.FaceEnemy)
	self:Stance()
	end
	end)
	end
end
function ENT:Yakuza_Melee(enemy)
	if self.Blocking then return end
	if self.Combat == false and self.ReadyCombat then
	self.Combat = true
	self:FaceInstant(enemy)
	local ent = enemy
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3") and not ent.Combat and not ent.Downed and not ent.HeatAction and self.DynamicIntro then
	ent.HeatAction = true
	ent.Downed = true
	self.Downed = true
	self.HeatAction = true
	ent.Attacking = false
	ent.Dodging = false
	ent:Stance()
	self:Stance()
	ent.Combat = true
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		if ent:IsPossessed() then
		local ply = ent:GetPossessor()
		self.enemyplayer = ply
		self.enemyplayer:SetFOV(36+5,1,self)
		ent:Dispossess()
		ent:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(ent:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(ent:GetAngles())
		if self.MoneyBeggar then
		self.Camera:ResetSequence("hey_you_whats_up_man_give_me_money_please_cam")
		elseif self.Fatso then
		self.Camera:ResetSequence("btlst_big_cam")
		elseif self.Bat or self.Golf then
		self.Camera:ResetSequence("btlst_bat_cam")
		elseif self.Yop then
		self.Camera:ResetSequence("btlst_ypp_cam")
		else
		self.Camera:ResetSequence("btlst_katsuage_cam")
		end
		self.Cam = ents.Create("prop_physics")
		self.Cam:SetModel("models/dav0r/camera.mdl")
		self.Cam:DrawShadow(false)
		self.Cam:SetRenderMode(1)
		self.Cam:SetColor(Color(255, 255, 255, 0))
		self.Cam:SetMoveType( MOVETYPE_NONE )
		self.Cam:SetParent(self.Camera)
		self.Cam:Fire("setparentattachment","camera")
		self.Cam:SetPos(self.Camera:GetPos())
		self.Cam:SetNotSolid(true)
		self.Cam:Spawn()
		self.Cam:SetAngles(Angle(self.Camera:GetAngles().x, self.Camera:GetAngles().y, self.Camera:GetAngles().z))
		ply:SetViewEntity(self.Cam)
		ply:SetNoDraw(true)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		end
		if self.MoneyBeggar then
		ent:PlaySequenceAndMoveAbsolute("hey_you_whats_up_man_give_me_money_please_sync")
		elseif self.Fatso then
		ent:PlaySequenceAndMoveAbsolute("btlst_big_sync1")
		elseif self.Bat or self.Golf then
		ent:PlaySequenceAndMoveAbsolute("btlst_bat_sync1")
		elseif self.Yop then
		ent:PlaySequenceAndMoveAbsolute("btlst_ypp_sync1")
		else
		ent:PlaySequenceAndMoveAbsolute("btlst_katsuage_sync1")
		end
		if IsValid(self.Camera) then
		self.enemyplayer:SetFOV(0,0.5,self)
		ent:SetPossessionEnabled(true)
		self.enemyplayer:Freeze(false)
		self.enemyplayer:GodDisable()
		self.enemyplayer:SetNoDraw(false)
		self.enemyplayer:SetViewEntity(ply)
		ent:Possess(self.enemyplayer)
		self.Cam:Remove()
		self.Camera:Remove()
		end
		ent.Downed = false
		ent.HeatAction = false
		end)
		local col = self:GetCollisionGroup()
		self.Damage = 30
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.MoneyBeggar then
		self:PlaySequenceAndMoveAbsolute("hey_you_whats_up_man_give_me_money_please_sync1")
		elseif self.Fatso then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_big.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_big_sync")
		elseif self.Bat or self.Golf then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_bat.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_bat_sync")
		elseif self.Yop then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_ypp.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_ypp_sync")
		else
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_katsuage.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_katsuage_sync")
		end
		if self.SFX then 
		self.SFX:Stop()
		end
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
	elseif self.BattleStart then
	self:Stance()
	if self.Boss then
		self:Timer(3,function()
			if #self.StartSounds > 0 then
				self:EmitSound(self.StartSounds[math.random(#self.StartSounds)])
			end
		end)
	end
		if self.StanceBattleStart then
			self:Timer(6,function()
				self.IdleStarter = false
			end)
			self.IdleStarter = true
		else
			self:PlaySequenceAndMove(self.BattleStartAnimation,1)
		end
	else
	if self.A then
	self:PlaySequenceAndMove("enc_run_a_stop",1)
	if self.Bat or self.Golf then
	self:PlaySequenceAndMove("enc_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana or self.Tnn then
	self:PlaySequenceAndMove("enc_lumb_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun or self.Smg then
	self:PlaySequenceAndMove("enc_gun_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Pipe or self.Baton or self.Sai or self.Tonfa then
	self:PlaySequenceAndMove("enc_batton_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Wpg or self.WpgHammer then
	self:PlaySequenceAndMove("enc_wpg_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.GunB then
	self:PlaySequenceAndMove("enc_gun_b_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	elseif self.B then
	self:PlaySequenceAndMove("enc_run_b_stop",1)
	if self.Bat or self.Golf then
	self:PlaySequenceAndMove("enc_bat_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana or self.Tnn then
	self:PlaySequenceAndMove("enc_lumb_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun or self.Smg then
	self:PlaySequenceAndMove("enc_gun_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Pipe or self.Baton or self.Sai or self.Tonfa then
	self:PlaySequenceAndMove("enc_batton_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Wpg or self.WpgHammer then
	self:PlaySequenceAndMove("enc_wpg_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.GunB then
	self:PlaySequenceAndMove("enc_gun_b_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	end
	end
	self:Stance()
	end
	if self:GetCooldown("GoonAttack")<=0 and not enemy.Downing then
		self.Stay = false
		self:SetCooldown("StayD",0)
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsNextBot() then
				if v:GetEnemy() == self:GetEnemy() and not v.Angr then
					v:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
				end
			end
		end
		if self.Angr or self.Heat then
		self:SetCooldown("GoonAttack",math.random(self.HeatAtkCooldown1,self.HeatAtkCooldown2))
		else
		self:SetCooldown("GoonAttack",math.random(self.AtkCooldown1,self.AtkCooldown2))
		end
	//self.Attacking = true
	if enemy.Downed then
	if self.Yop then
	self:AttackReset()
	self:PlaySequenceAndMove("yop_provoke",1)
	elseif self.Bat or self.Golf then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 10
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self.Trample = true
	self:FaceInstant(enemy)
	if math.random(2) == 1 then
	self:PlaySequenceAndMove("bat_atk_down_a",1)
	else
	self:PlaySequenceAndMove("bat_atk_down_b",1)
	end
	self.Trample = false
	self:AttackReset()
	elseif self.Aiz then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("aiz_provoke"..math.random(2),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 25
	self:FaceInstant(enemy)
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("aiz_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.FBat then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("fat_bat_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("fat_bat_atk_down_press",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Fat then
	self.Damage = 30
	self:FaceInstant(enemy)
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("fat_atk_down",1)
	self.Trample = false
	self:AttackReset()
	elseif self.Msk then
	self.Damage = 30
	self:FaceInstant(enemy)
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("msk_atk_down_press",1)
	self.Trample = false
	self:AttackReset()
	elseif self.Tam then
	self:AttackReset()
	self:PlaySequenceAndMove("tam_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Iha then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("iha_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("iha_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Yah then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("yah_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("yah_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Mnm then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("mnm_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("mnm_atk_down",1)
	self:AttackReset()
	end
	elseif self.Gor then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("gor_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("gor_atk_down_01",1)
	self:AttackReset()
	end
	elseif self.Rik then
	self:AttackReset()
	self:PlaySequenceAndMove("rik_provoke",1)
	elseif self.Kuz then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("kuz_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 35
	self.SetupType = DMG_GENERIC
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("kuz_atk_down",1)
	self:AttackReset()
	end
	elseif self.Knd then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("knd_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("knd_atk_run_hip",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Ryu0 then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("ryu0_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("iwa_atk_down",1)
	self:AttackReset()
	end
	elseif self.Iwa then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("iwa_atk_down",1)
	self:AttackReset()
	elseif self.Dgo then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("dgo_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("dgo_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Sai then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("sai_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_CRUSH
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("sai_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Tnn then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("tnn_provoke_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self.Trample = false
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("tnn_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Tonfa or self.Oda then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("oda_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("oda_atk_down",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Pow then
	self.Damage = 50
	self.SetupType = DMG_SLASH
	self.WeaponDamage = 50
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self.Trample = false
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("pow_atk_down",1)
	self.Trample = false
	self:AttackReset()
	elseif self.RicGun then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = false
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("ric_gun_atk_down_kick",1)
	self.Trample = false
	self:AttackReset()
	elseif self.Kaz then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("kaz_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("kaz_atk_down_punch",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Ric then
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("ric_provoke",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = false
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("ric_atk_down_kick",1)
	self.Trample = false
	self:AttackReset()
	end
	elseif self.Wpg or self.WpgHammer then
	self.Fin = true
	self.Trample = true
	self:FaceInstant(enemy)
	self.WeaponDamage = 125
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_atk_heavy_tate",1)
	self.Trample = false
	self:AttackReset()
	self.Fin = false
	elseif self.FWPC then
	self:SetCooldown("GoonAttack",2)
	if not self.WPCCharge1 then
	self:AttackReset()
	self.WPCCharge1 = true
	self.ShiftIdleAnimation = "fat_wpc_atk_mid_lp"
	elseif self.WPCCharge1 and not self.WPCCharge2 then
	self:AttackReset()
	self.WPCCharge2 = true
	self.ShiftIdleAnimation = "fat_wpc_atk_hi_lp"
	elseif self.WPCCharge2 and self.WPCCharge2 then
	self.Damage = 150
	self.WPCCharge1 = false
	self.WPCCharge2 = false
	self.SetupType = DMG_VEHICLE
	self.Fin = true
	self.WeaponDamage = 150
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("fat_wpc_atk_tame",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Fin = false
	self.ShiftIdleAnimation = "fat_wpc_shift_idle"
	self:SetCooldown("GoonAttack",1)
	end
	elseif self.Baton or self.Pipe then
	self:AttackReset()
	self:PlaySequenceAndMove("batton_provoke",1)
	else
	local att = math.random(1,2)
	if att==1 then
	self:AttackReset()
	self:PlaySequenceAndMove("provoke"..math.random(19),1)
	elseif att==2 then
	self:FaceInstant(enemy)
	local rng = math.random(7)
	if rng==1 then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("atk_down_drop",1)
	self.Trample = false
	self:AttackReset()
	elseif rng==2 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("atk_down_knee",1)
	self.Trample = false
	self:AttackReset()
	elseif rng==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("atk_down_l_kick",1)
	self:AttackReset()
	elseif rng==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("atk_down_l_stomp",1)
	self.Trample = false
	self:AttackReset()
	elseif rng==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("atk_down_r_kick",1)
	self:AttackReset()
	elseif rng==6 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("atk_down_r_stomp",1)
	self.Trample = false
	self:AttackReset()
	elseif rng==7 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:PlaySequenceAndMove("atk_down_r_stomp_02",1)
	self.Trample = false
	self:AttackReset()
	end
	end
	end
	else
	if self.Normal or self.ThrowKnifeLower or self.ThrowBombLower then
	if self.Boss then
		local att = math.random(1,7)
		if att==1 then
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==2 then
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("kbx_cmbkick01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==3 then
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("tam_cmb01_b",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==4 then
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==5 then
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_chop",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==6 then
		self.Damage = 50
		self.SetupType = DMG_PHYSGUN
		self:PlaySequenceAndMove("tam_atk_heavy_hammer",1,function(self,cycle)if cycle < 0.4 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==7 then
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_punch",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		end
	else
		local att = math.random(1,8)
		if att==1 then
		self.Damage = 15
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==2 then
		self.Damage = 25
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_punch",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==3 then
		self.Damage = 30
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==4 then
		self.Damage = 35
		self.SetupType = DMG_AIRBOAT
		self:PlaySequenceAndMove("atk_runknee",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==5 then
		self.Damage = 35
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_run2hitcombo",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==6 then
		self.Damage = 20
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_chop",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==7 then
		self.Damage = 30
		self.SetupType = DMG_FALL
		self:PlaySequenceAndMove("atk_runpunch",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		self:AttackReset()
		elseif att==8 then
		self.Damage = 10
		self.SetupType = DMG_GENERIC
		self:PlaySequenceAndMove("atk_punch_s",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
		self:AttackReset()
		end
	end
	elseif self.KBox then
	local att = math.random(1,5)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kbx_cmbkick01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("kbx_atk_flyingknee",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 35
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kbx_atk_kick",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kbx_atk_lowkick",1)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 35
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("kbx_atk_rollkick",1)
	self:AttackReset()
	end
	elseif self.Box then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("box_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("box_atk_jab",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("box_atk_upper",1)
	self:AttackReset()
	end
	elseif self.Tackle then
	local att = math.random(1,2,3,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tac_atk_hook",1)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tac_tackle_miss",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tac_atk_punch_3ren")
    elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tac_atk_run")
	end
	elseif self.Cpr then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cpr_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cpr_atk_chop",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("cpr_atk_hammer",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cpr_atk_kick",1)
	self:AttackReset()
	end
	elseif self.Karate then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("krt_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("krt_cmbpunch01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("krt_atk_knee",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("krt_atk_turning_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Inf then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("inf_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("inf_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("inf_atk_heavy",1)
	self:AttackReset()
	end
	elseif self.Sir then
	local att = math.random(1,8)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("sir_atk_away_hook",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("sir_atk_away_kick_l",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("sir_atk_away_kick_r",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("sir_atk_away_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("sir_atk_dempsey",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("sir_atk_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("sir_atk_rendapunch",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==8 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("sir_atk_shoulder_miss",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Judo then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("jdo_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("jdo_atk_hook",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("jdo_atk_punch_3ren",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Mnm then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("mnm_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("mnm_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("mnm_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("mnm_atk_run",1)
	self:AttackReset()
	end
	elseif self.Msk then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("msk_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("msk_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("msk_cmb01_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("msk_atk_heavy_kick",1)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.Sync = true
	self.SPDamage = 20
	self.SyncFAnimation = "msk_atk_jump_nage_sync"
	self.SyncBAnimation = "msk_atk_jump_nage_sync"
	self.Sync1FAnimation = "msk_atk_jump_nage_f_sync1"
	self.Sync1BAnimation = "msk_atk_jump_nage_b_sync1"
	self:PlaySequenceAndMove("msk_atk_jump_miss",1)
	self.Sync = false
	self:AttackReset()
	elseif att==6 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.Sync = true
	self.SPDamage = 20
	self.SyncFAnimation = "msk_atk_run_nage_sync"
	self.SyncBAnimation = "msk_atk_run_nage_sync"
	self.Sync1FAnimation = "msk_atk_run_nage_f_sync1"
	self.Sync1BAnimation = "msk_atk_run_nage_b_sync1"
	self:PlaySequenceAndMove("msk_atk_run_miss",1)
	self.Sync = false
	self:AttackReset()
	end
	elseif self.Gor then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gor_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gor_cmbsholder01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gor_atk_01",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("gor_atk_02",1)
	self:AttackReset()
	end
	elseif self.Fat then
	local att = math.random(1,7)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("fat_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("fat_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("fat_atk_enzui",1,function(self,cycle)if cycle < 0.4 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("fat_atk_headbutt",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("fat_atk_kick",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("fat_atk_run_dropkick",1)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 50
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("fat_atk_tame_sp",1)
	self:AttackReset()
	end
	elseif self.Yop then
	local att = math.random(1,5)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("yop_atk_punch_2ren",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("yop_atk_punch",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("yop_atk_kick",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("yop_atk_knee",1)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.YOPSZ = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("yop_seize_grab_miss",1)
	self.YOPSZ = false
	self:AttackReset()
	end
	elseif self.Jak then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("jak_atk_brucekick",1)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("jak_atk_kungfupunch",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("jak_atk_nirenkiyaku",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("jak_atk_senpukyaku",1)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("jak_atk_snakechopsting",1)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 30
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("jak_atk_tobigeri",1)
	self:AttackReset()
	end
	elseif self.Bat then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("bat_cmb_3ren",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_PHYSGUN
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("bat_atk_heavy",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_NEVERGIB
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("bat_atk_jump",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_AIRBOAT
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("bat_atk_run",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	end
	elseif self.Knife or self.Taser then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 10
	self.WeaponDamage = 40
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_BULLET
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_BULLET
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife_atk_run_sting",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 35
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife_atk_tuki",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 15
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife_atk_tuki_upper",1)
	self:AttackReset()
	end
	elseif self.Knife2 then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 10
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife2_cmb01",1,function(self,cycle)if cycle < 0.2 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 35
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife2_atk_sting_3ren",1,function(self,cycle)if cycle < 0.3 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 15
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("knife2_atk",1)
	self:AttackReset()
	end
	elseif self.Katana or self.WKatana then
	local att = math.random(1,2)
	if att==1 then
	self.Damage = 10
	self.WeaponDamage = 10
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("lumb_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 35
	self.WeaponDamage = 35
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_BULLET
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("lumb_atk_tuki",1)
	self:AttackReset()
	end
	elseif self.JkS then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("jak_sword_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("jak_sword_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("jak_sword_atk_2ren",1)
	self:AttackReset()
	end
	elseif self.Shotgun then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self.WeaponDamage = 40
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("shotgun_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif self.Aiz then
	local att = math.random(1,9)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 45
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("aiz_atk_hammer",1)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("aiz_atk_hook",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_atk_kick",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	local att = math.random(1,1)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_atk_dodge_l",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_atk_dodge_r",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	self:AttackReset()
	elseif att==6 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_atk_provoke_miss",1,function(self,cycle)if cycle < 0.75 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 50
	self.Tackle = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_tackle_miss",1)
	self.Tackle = false
	self:AttackReset()
	elseif att==8 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_cmbhook01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==9 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("aiz_cmbsp01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==10 then
	self.Damage = 35
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("aiz_atk_run",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	elseif self.FBat then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("fat_bat_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 50
	self.SetupType = DMG_VEHICLE
	self.WeaponDamage = 50
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_VEHICLE
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_VEHICLE
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("fat_bat_atk_tame_sp",1,function(self,cycle)if cycle < 0.35 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==3 then
	self.Damage = 35
	self.SetupType = DMG_ALWAYSGIB
	self.WeaponDamage = 35
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("fat_bat_atk_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	end
	elseif self.Tam then
	local att = math.random(1,8)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tam_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tam_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tam_cmb01_c",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tam_cmb01_d",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("tam_atk_hammer",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 50
	self.SetupType = DMG_PHYSGUN
	self:PlaySequenceAndMove("tam_atk_heavy_hammer",1,function(self,cycle)if cycle < 0.4 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 25
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("tam_atk_upper",1,function(self,cycle)if cycle < 0.4 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==8 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("tam_atk_uraken",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Tnn then
	local att = math.random(1,5)
	if att==1 then
	self.WeaponDamage = 20
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("tnn_cmb01_assassin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("tnn_cmb01_power",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.WeaponDamage = 20
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_PREVENT_PHYSICS_FORCE
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("tnn_atk_3rentsuki",1)
	self.Tsuki = false
	self.Fin = false
	self:AttackReset()
	elseif att==4 then
	self.WeaponDamage = 35
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Tsuki = true
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("tnn_atk_tsuki",1)
	self.Tsuki = false
	self.Fin = false
	self:AttackReset()
	elseif att==5 then
	self.WeaponDamage = 35
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_CRUSH
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("tnn_atk_kiri_c",1)
	self:AttackReset()
	end
	elseif self.Iha then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("iha_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("iha_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.NoDown = true
	self.SetupType = DMG_VEHICLE
	self:PlaySequenceAndMove("iha_atk_headbutt",1)
	self.NoDown = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.NoDown = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("iha_atk_heavy_straight",1)
	self.NoDown = false
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("iha_atk_kick",1)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 35
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("iha_atk_lowhook",1)
	self:AttackReset()
	end
	elseif self.Yah then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("yah_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("yah_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.SetupType = DMG_PHYSGUN
	self:PlaySequenceAndMove("yah_atk_heavy",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("yah_atk_hook",1)
	self:AttackReset()
	end
	elseif self.Rik then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rik_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rik_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rik_atk_chop",1)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rik_atk_heavy_kick",1)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 35
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("rik_atk_jump_knee",1)
	self:AttackReset()
	end
	elseif self.Kuz then
	local att = math.random(1,8)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_cmb01_headbutt",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_cmb01_renda",1)
	self:AttackReset()
	elseif att==5 then
	self.AntiAttack = true
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_atk_anti_sway_miss",1)
	self.AntiAttack = false
	self:AttackReset()
	elseif att==6 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_atk_heavy",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 45
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("kuz_atk_hiji_2ren",1)
	self:AttackReset()
	elseif att==8 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kuz_atk_jab",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Knd then
	local att = math.random(1,11)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("knd_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("knd_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("knd_atk_chop_suihei",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("knd_atk_harite",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 40
	self.NoDown = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("knd_atk_headbutt",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.NoDown = false
	elseif att==6 then
	self.Damage = 40
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("knd_atk_heavy_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("knd_atk_heavy_punch",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==8 then
	self.Damage = 25
	self.NoDown = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("knd_atk_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.NoDown = false
	elseif att==9 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("knd_atk_punch",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==10 then
	self.Damage = 30
	self.Bound = true
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("knd_atk_rariatto",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Bound = false
	elseif att==11 then
	self.Damage = 30
	self.SetupType = DMG_PHYSGUN
	self:PlaySequenceAndMove("knd_atk_run_hip",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Ryu0 then
	local att = math.random(1,5)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dgo_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("ric_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 40
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("dgo_atk_run_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rik_atk_heavy_kick",1)
	self.NoDown = false
	end
	elseif self.Dgo then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dgo_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 40
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("dgo_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 30
	self.NoDown = true
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("dgo_atk_jump_knee",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	self.NoDown = false
	elseif att==4 then
	self.Damage = 35
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("dgo_atk_run_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Iwa then
	local att = math.random(1,5)
	if att==1 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("iwa_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("iwa_cmb01_b_mid",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.Stun = true
	self.NoDown = true
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("iwa_atk_heavy_kick_hi",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Stun = false
	self.NoDown = false
	elseif att==4 then
	self.Damage = 20
	self.IWANL = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("iwa_atk_necklock_miss",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.IWANL = false
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("iwa_atk_sway_f_knee",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Pipe or self.Gun or self.Smg then
	local att = math.random(1,2)
	if att==1 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("batton_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self.WeaponDamage = 40
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("batton_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	end
	elseif self.Baton then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self.Fin = true
	self.WeaponDamage = 40
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("batton_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Fin = false
	elseif self.Sai then
	local att = math.random(1,5)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 20
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("sai_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 20
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("sai_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("sai_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 40
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("sai_atk_jump",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("sai_atk_run_bodypress",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Tonfa then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_cmb01_blow",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 80
	self.Stun = true
	self.NoDown = true
	self.SetupType = DMG_CRUSH
	self.WeaponDamage = 80
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_CRUSH
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_hammer",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self.Stun = false
	self.NoDown = false
	self:AttackReset()
	elseif att==3 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_roll",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("oda_atk_tonfa_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_tonfa_nage_miss",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 30
	self.SetupType = DMG_ALWAYSGIB
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_ALWASYGIB
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Oda then
	local att = math.random(1,7)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_cmb01_aniki",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 15
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_cmb01_blow",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 80
	self.Stun = true
	self.NoDown = true
	self.SetupType = DMG_CRUSH
	self.WeaponDamage = 80
	if self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	else
		self.WeaponDamageType = DMG_CRUSH
	end
	self:PlaySequenceAndMove("oda_atk_hammer",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Stun = false
	self.NoDown = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_roll",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("oda_atk_tonfa_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_tonfa_nage_miss",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 30
	self.SetupType = DMG_ALWAYSGIB
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_ALWASYGIB
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_ALWAYSGIB
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("oda_atk_upper",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Pow then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 40
	self.SetupType = DMG_SLASH
	self:PlaySequenceAndMove("pow_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 50
	self.SetupType = DMG_SLASH
	self:PlaySequenceAndMove("pow_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.Fin = true
	self.SetupType = DMG_SLASH
	self:PlaySequenceAndMove("pow_atk_jump",1)
	self.Fin = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 50
	self.Fin = true
	self.SetupType = DMG_GENERIC
	self:EmitSound("yakuza0/weapons/chainsaw/charge.wav",85)
	self:PlaySequenceAndMove("pow_atk_sp",1)
	self.Fin = false
	self:AttackReset()
	end
	elseif self.Dat then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dat_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("dat_atk_heavy_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dat_atk_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Lee then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("lee_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("lee_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("lee_atk_kick_hi",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("lee_atk_kick_mid",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_CRUSH
	self.Stun = true
	self.NoDown = true
	self:PlaySequenceAndMove("lee_atk_punch",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Stun = false
	self.NoDown = false
	elseif att==6 then
	self.Damage = 50
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("lee_atk_run_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Golf then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 10
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("golf_cmb01_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 25
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("golf_cmb01_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("golf_atk_run",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	elseif att==4 then
	self.Damage = 50
	self.SetupType = DMG_AIRBOAT
	self.WeaponDamage = 50
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_AIRBOAT
	elseif self.WeaponType == 1 then
		self.Fin = true
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("golf_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self.Fin = false
	self:AttackReset()
	end
	elseif self.RicGun then
	local att = math.random(1,4)
	if att==1 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("ric_gun_atk_kick_jump",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 40
	self.BoundG = true
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("ric_gun_atk_kick_ssk",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.BoundG = false
	self:AttackReset()
	elseif att==3 then
	self.Damage = 30
	self.SetupType = DMG_CRUSH
	self.Stun = true
	self.NoDown = true
	self:PlaySequenceAndMove("ric_gun_atk_run_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Stun = false
	self.NoDown = false
	elseif att==4 then
	self.NoDown = true
	self.Damage = 15
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("ric_gun_atk_sway_f_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.NoDown = false
	self:AttackReset()
	end
	elseif self.Kaz then
	local att = math.random(1,7)
	if att==1 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kaz_cmb01_a",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kaz_cmb01_b",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kaz_cmb01_c",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("kaz_atk_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 15
	self.NoDown = true
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("kaz_atk_kick_2dan",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.NoDown = false
	self:AttackReset()
	elseif att==6 then
	self.Damage = 40
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("kaz_atk_punch_heavy",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==7 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("kaz_atk_run_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Ric then
	local att = math.random(1,8)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("ric_cmb01_a",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 15
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("ric_cmb01_b",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("ric_cmb01_c",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("ric_cmb01_sp",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("ric_atk_kick_jump",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 40
	self.BoundG = true
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("ric_atk_kick_ssk",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.BoundG = false
	self:AttackReset()
	elseif att==7 then
	self.Damage = 30
	self.Stun = true
	self.NoDown = true
	self.SetupType = DMG_CRUSH
	self:PlaySequenceAndMove("ric_atk_run_kick",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Stun = false
	self.NoDown = false
	elseif att==8 then
	self.NoDown = true
	self.Damage = 15
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("ric_atk_sway_f_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self.NoDown = false
	self:AttackReset()
	end
	elseif self.GunB then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gun_b_cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif self.Wpg then
	local att = math.random(1,3)
	if att==1 then
	self.WeaponDamage = 70
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Fin = true
	self.WeaponDamage = 125
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_atk_heavy_tate",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Fin = false
	elseif att==3 then
	self.WeaponDamage = 75
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_atk_heavy_yoko",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.WpgHammer then
	local att = math.random(1,3)
	if att==1 then
	self.WeaponDamage = 70
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_hammer_cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Fin = true
	self.WeaponDamage = 100
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("wpg_hammer_atk_heavy_tate",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Fin = false
	elseif att==3 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("wpg_hammer_atk_kick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Gng then
	local att = math.random(1,6)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gng_cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 20
	self.NoDown = true
	self.SetupType = DMG_VEHICLE
	self:PlaySequenceAndMove("gng_atk_headbutt",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.NoDown = false
	elseif att==3 then
	self.Damage = 40
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("gng_atk_highkick",1,function(self,cycle)if cycle < 0.1 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 30
	self.SetupType = DMG_AIRBOAT
	self:PlaySequenceAndMove("gng_atk_jumpknee",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("gng_atk_kick_ss",1,function(self,cycle)if cycle < 0.2 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 50
	self.SetupType = DMG_VEHICLE
	self:PlaySequenceAndMove("gng_atk_mawasigeri",1,function(self,cycle)if cycle < 0.2 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.Cap then
	local att = math.random(1,10)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_cmb01_a",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_cmb01_b",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==3 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_cmb01_dodge_r",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==4 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_cmb01_dodge_l",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==5 then
	self.Damage = 40
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("cap_atk_backflip",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==6 then
	self.Damage = 30
	self.NoDown = true
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("cap_atk_kick_hi",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.NoDown = false
	elseif att==7 then
	self.Damage = 30
	self.SetupType = DMG_DIRECT
	self:PlaySequenceAndMove("cap_atk_kick_low",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==8 then
	self.Damage = 30
	self.SetupType = DMG_PHYSGUN
	self:PlaySequenceAndMove("cap_atk_kick_mid",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==9 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_atk_kick01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==10 then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("cap_atk_kick02",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	elseif self.FWPC then
	self:SetCooldown("GoonAttack",1)
	if not self.WPCCharge1 then
	self:AttackReset()
	self.WPCCharge1 = true
	self.ShiftIdleAnimation = "fat_wpc_atk_mid_lp"
	elseif self.WPCCharge1 and not self.WPCCharge2 then
	self:AttackReset()
	self.WPCCharge2 = true
	self.ShiftIdleAnimation = "fat_wpc_atk_hi_lp"
	elseif self.WPCCharge2 and self.WPCCharge2 then
	self.Damage = 150
	self.WPCCharge1 = false
	self.WPCCharge2 = false
	self.SetupType = DMG_VEHICLE
	self.Fin = true
	self.WeaponDamage = 150
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_NEVERGIB
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("fat_wpc_atk_tame",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	self.Fin = false
	self.ShiftIdleAnimation = "fat_wpc_shift_idle"
	self:SetCooldown("GoonAttack",1)
	end
	elseif self.WPH then
	local att = math.random(1,2)
	if att==1 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 20
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_GENERIC
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("stool_cmb01",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	elseif att==2 then
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self.WeaponDamage = 30
	if self.WeaponType == 0 then
		self.WeaponDamageType = DMG_FALL
	elseif self.WeaponType == 1 then
		self.WeaponDamageType = DMG_SLASH
	elseif self.WeaponType == 2 then
		self.WeaponDamageType = DMG_SHOCK
	elseif self.WeaponType == 3 then
		self.WeaponDamageType = DMG_POISON
	elseif self.WeaponType == 4 then
		self.WeaponDamageType = DMG_BLAST
	end
	self:PlaySequenceAndMove("stool_atk_heavy",1,function(self,cycle)if cycle < 0.25 then self:FaceEnemy() end end)
	self:AttackReset()
	end
	end
	end
	else 	

	local mdirection = math.random(4)
	if mdirection == 4 or self.Aggressor then
		self:Yakuza_Range(enemy)
	else
		self:Yakuza_Strafe(enemy,mdirection)
	end
	end
end
function ENT:OnMeleeAttack(enemy)
	if not self:IsInRange(enemy,self.MeleeAttackRange) then return end
	self:Yakuza_Melee(enemy)
	
end
function ENT:OnNewEnemy(enemy)
	if GetConVarNumber("ai_disabled") == 1 then
		self.ReadyCombat = true
	end
	if GetConVarNumber("ai_disabled") == 1 or self.Combat then return end
	self:CallInCoroutine(function()
	if self.A then
	self:PlaySequenceAndMove("enc_st_a",1,self.FaceEnemy)
	elseif self.B then
	self:PlaySequenceAndMove("enc_st_b",1,self.FaceEnemy)
	end
	self.ReadyCombat = true
	end)
end
function ENT:AttackReset()
	if self.IdleStarter then
		self.IdleStarter = false
	end
	self.CantDodge = false
	self.Attacking = false
	self.Swinging = false
end
function ENT:DrawWeapon()
	if not IsValid(self.Weapon) then
	self.Weapon = ents.Create("obj_yakuza_heat")
	self.Weapon:SetModel("models/scot/yakuza0/yakuza_weapon.mdl")
	self.Weapon:Spawn()
	self.Weapon:SetParent(self)
	self.Weapon:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
	self.Weapon:SetBodygroup(0,self.WeaponModel)
	if self.Weapon:GetBodygroup(0) == 16 then
	self.OnIdleSounds ={"yakuza0/weapons/chainsaw/idle1.wav","yakuza0/weapons/chainsaw/idle2.wav"}
	self.IdleSoundDelay = 0
	end
	end
end
function ENT:Stance()
	if self.HasTheme then
	if GetConVarNumber(self.GameThemeConvar) == 1 then
	if !self.ThemeSongLoop then 
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.ThemeSongLoop = CreateSound(game.GetWorld(),self.ThemeSong, filter)
		self.ThemeSongLoop:SetSoundLevel(0)
	end
	self.ThemeSongLoop:Play()
	end
	end
	if self.Normal or self.ThrowKnifeLower or self.ThrowBombLower then
	self.ShiftIdleAnimation = "shift_idle1"
	self.ShiftAnimation = "shift"
	self.ShiftRunAnimation = "run"
	elseif self.Box then
	self.ShiftIdleAnimation = "box_shift_idle"
	self.ShiftAnimation = "box_shift"
	self.ShiftRunAnimation = "box_run"
	elseif self.KBox then
	self.ShiftIdleAnimation = "kbx_shift_idle"
	self.ShiftAnimation = "kbx_shift"
	self.ShiftRunAnimation = "kbx_run"
	elseif self.Karate then
	self.ShiftIdleAnimation = "krt_shift_idle"
	self.ShiftAnimation = "krt_shift"
	self.ShiftRunAnimation = "krt_run"
	self.GuardStartAnimation = "krt_guard_st"
	self.GuardLoopAnimation = "krt_guard_lp"
	self.GuardEndAnimation = "krt_guard_en"
	self.GuardHitAnimation = "krt_guard_hit"
	elseif self.Tackle then
	self.ShiftIdleAnimation = "tac_shift_idle"
	self.ShiftAnimation = "tac_shift"
	self.ShiftRunAnimation = "tac_run"
	elseif self.Cpr then
	self.ShiftIdleAnimation = "cpr_shift_idle"
	self.ShiftAnimation = "cpr_shift"
	self.ShiftRunAnimation = "run"
	elseif self.Judo then
	self.ShiftIdleAnimation = "jdo_shift_idle"
	self.ShiftAnimation = "jdo_shift"
	self.ShiftRunAnimation = "jdo_run"
	self.SwayBackAnimation = "jdo_sway_b"
	self.SwayForwardAnimation = "jdo_sway_f"
	self.SwayRightAnimation = "jdo_sway_r"
	self.SwayLeftAnimation = "jdo_sway_l"
	self.GuardStartAnimation = "jdo_guard_st"
	self.GuardLoopAnimation = "jdo_guard_lp"
	self.GuardEndAnimation = "jdo_guard_en"
	self.GuardHitAnimation = "jdo_guard_hit"
	elseif self.Inf then
	self.ShiftIdleAnimation = "inf_shift_idle"
	self.ShiftAnimation = "inf_shift"
	self.ShiftRunAnimation = "enc_run_a"
	elseif self.Sir then
	self.ShiftIdleAnimation = "sir_shift_idle"
	self.ShiftAnimation = "shift"
	self.ShiftRunAnimation = "run"
	elseif self.Gor then
	self.ShiftIdleAnimation = "gor_shift_idle"
	self.ShiftAnimation = "gor_shift"
	self.ShiftRunAnimation = "gor_run"
	self.SwayBackAnimation = "gor_sway_b"
	self.SwayForwardAnimation = "gor_sway_f"
	self.SwayRightAnimation = "gor_sway_r"
	self.SwayLeftAnimation = "gor_sway_l"
	self.GuardStartAnimation = "gor_guard_st"
	self.GuardLoopAnimation = "gor_guard_lp"
	self.GuardEndAnimation = "gor_guard_en"
	self.GuardHitAnimation = "gor_guard_hit"
	elseif self.Mnm then
	self.ShiftIdleAnimation = "mnm_shift_idle"
	self.ShiftAnimation = "mnm_shift"
	self.ShiftRunAnimation = "mnm_run"
	self.SwayBackAnimation = "mnm_sway_b"
	self.SwayForwardAnimation = "mnm_sway_f"
	self.SwayRightAnimation = "mnm_sway_r"
	self.SwayLeftAnimation = "mnm_sway_l"
	self.GuardStartAnimation = "mnm_guard_st"
	self.GuardLoopAnimation = "mnm_guard_lp"
	self.GuardEndAnimation = "mnm_guard_en"
	self.GuardHitAnimation = "mnm_guard_hit"
	elseif self.Msk then
	self.ShiftIdleAnimation = "msk_shift_idle"
	self.ShiftAnimation = "msk_shift"
	self.ShiftRunAnimation = "run"
	elseif self.Fat then
	self.AttackArmor = true
	self.ShiftIdleAnimation = "fat_shift_idle"
	self.ShiftAnimation = "fat_shift"
	self.GuardStartAnimation = "fat_guard_st"
	self.GuardLoopAnimation = "fat_guard_lp"
	self.GuardEndAnimation = "fat_guard_en"
	self.GuardHitAnimation = "fat_guard_hit"
	elseif self.Yop then
	if self.Hide then
		self.ShiftIdleAnimation = "idle_dam"
		self.ShiftAnimation = "gng_shift"
		self.ShiftRunAnimation = "run_dash"
		self.SwayBackAnimation = "sway_b"
		self.SwayForwardAnimation = "sway_f"
		self.SwayRightAnimation = "sway_r"
		self.SwayLeftAnimation = "sway_l"
	else
		self.ShiftIdleAnimation = "yop_shift_idle"
		self.ShiftAnimation = "yop_shift"
		self.ShiftRunAnimation = "yop_run"
		self.SwayBackAnimation = "yop_sway_b"
		self.SwayForwardAnimation = "yop_sway_f"
		self.SwayRightAnimation = "yop_sway_r"
		self.SwayLeftAnimation = "yop_sway_l"
	end
	self.GuardStartAnimation = "yop_guard_st"
	self.GuardLoopAnimation = "yop_guard_lp"
	self.GuardEndAnimation = "yop_guard_en"
	self.GuardHitAnimation = "yop_guard_hit"
	elseif self.Bat then
	self:DrawWeapon()
	local anim = math.random(3)
	if anim==1 then
	self.ShiftIdleAnimation = "bat_shift_idle1"
	self.ShiftAnimation = "bat_shift1"
	elseif anim==2 then
	self.ShiftIdleAnimation = "bat_shift_idle2"
	self.ShiftAnimation = "bat_shift2"
	elseif anim==3 then
	self.ShiftIdleAnimation = "bat_shift_idle3"
	self.ShiftAnimation = "bat_shift3"
	end
	self.ShiftRunAnimation = "bat_run"
	self.GuardStartAnimation = "bat_guard_st"
	self.GuardLoopAnimation = "bat_guard_lp"
	self.GuardEndAnimation = "bat_guard_en"
	self.GuardHitAnimation = "bat_guard_hit"
	elseif self.Knife or self.Taser then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "knife_shift_idle"
	self.ShiftAnimation = "knife_shift"
	self.ShiftRunAnimation = "knife_run"
	elseif self.Katana or self.WKatana then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "lumb_shift_idle"
	self.ShiftAnimation = "lumb_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "batton_sway_b"
	self.SwayForwardAnimation = "batton_sway_f"
	self.SwayRightAnimation = "batton_sway_r"
	self.SwayLeftAnimation = "batton_sway_l"
	self.GuardStartAnimation = "lumb_guard_st"
	self.GuardLoopAnimation = "lumb_guard_lp"
	self.GuardEndAnimation = "lumb_guard_en"
	self.GuardHitAnimation = "lumb_guard_hit"
	elseif self.Jak then
	self.ShiftIdleAnimation = "jak_shift_idle"
	self.ShiftAnimation = "jak_shift"
	self.ShiftRunAnimation = "rik_run"
	self.SwayBackAnimation = "jak_sway_b"
	self.SwayForwardAnimation = "jak_sway_f"
	self.SwayRightAnimation = "jak_sway_r"
	self.SwayLeftAnimation = "jak_sway_l"
	self.GuardStartAnimation = "jak_guard_st"
	self.GuardLoopAnimation = "jak_guard_lp"
	self.GuardEndAnimation = "jak_guard_en"
	self.GuardHitAnimation = "jak_guard_hit"
	elseif self.JkS then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "jak_sword_shift_idle"
	self.ShiftAnimation = "jak_sword_shift"
	self.ShiftRunAnimation = "run"
	self.GuardStartAnimation = "jak_sword_guard_st"
	self.GuardLoopAnimation = "jak_sword_guard_lp"
	self.GuardEndAnimation = "jak_sword_guard_en"
	self.GuardHitAnimation = "jak_sword_guard_hit"
	elseif self.Shotgun then
	self:DrawWeapon()
	self.RangeAttackRange = 750
	self.CanRangeAttack = true
	self.RangeAtkCooldown1 = 30
	self.RangeAtkCooldown2 = 30
	self.ShiftIdleAnimation = "tlk_handhip1"
	self.ShiftAnimation = "shotgun_shift"
	self.ShiftRunAnimation = "shotgun_run"
	self.GuardStartAnimation = "shotgun_guard_st"
	self.GuardLoopAnimation = "shotgun_guard_lp"
	self.GuardEndAnimation = "shotgun_guard_en"
	self.GuardHitAnimation = "shotgun_guard_hit"
	elseif self.Knife2 then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "knife2_shift_idle"
	self.ShiftAnimation = "knife2_shift"
	self.ShiftRunAnimation = "knife_run"
	self.SwayBackAnimation = "knife2_sway_b"
	self.SwayForwardAnimation = "knife2_sway_f"
	self.SwayRightAnimation = "knife2_sway_r"
	self.SwayLeftAnimation = "knife2_sway_l"
	elseif self.Gun then
	self:DrawWeapon()
	self.RangeAttackRange = 750
	self.CanRangeAttack = true
	self.RangeAtkCooldown1 = 30
	self.RangeAtkCooldown2 = 30
	self.ShiftIdleAnimation = "tlk_handhip1"
	self.ShiftAnimation = "gun_shift"
	elseif self.Aiz then
	self.AttackArmor = true
	self.AttackSuperArmor = true
	self.ShiftIdleAnimation = "aiz_shift_idle"
	self.ShiftAnimation = "aiz_shift"
	self.ShiftRunAnimation = "aiz_run"
	self.SwayBackAnimation = "aiz_sway_b"
	self.SwayForwardAnimation = "aiz_sway_f"
	self.SwayRightAnimation = "aiz_sway_r"
	self.SwayLeftAnimation = "aiz_sway_l"
	self.GuardStartAnimation = "aiz_guard_st"
	self.GuardLoopAnimation = "aiz_guard_lp"
	self.GuardEndAnimation = "aiz_guard_en"
	self.GuardHitAnimation = "aiz_guard_hit"
	elseif self.FBat then
	self:DrawWeapon()
	self.AttackArmor = true
	self.ShiftIdleAnimation = "fat_bat_shift_idle"
	self.ShiftAnimation = "fat_bat_shift"
	self.ShiftRunAnimation = "fat_bat_run"
	self.GuardStartAnimation = "fat_bat_guard_st"
	self.GuardLoopAnimation = "fat_bat_guard_lp"
	self.GuardEndAnimation = "fat_bat_guard_en"
	self.GuardHitAnimation = "fat_bat_guard_hit"
	elseif self.Tam then
	self.ShiftIdleAnimation = "tam_shift_idle"
	self.ShiftAnimation = "tam_shift"
	self.ShiftRunAnimation = "tam_run"
	self.SwayBackAnimation = "tam_sway_b"
	self.SwayForwardAnimation = "tam_sway_f"
	self.SwayRightAnimation = "tam_sway_r"
	self.SwayLeftAnimation = "tam_sway_l"
	self.GuardStartAnimation = "tam_guard_st"
	self.GuardLoopAnimation = "tam_guard_lp"
	self.GuardEndAnimation = "tam_guard_en"
	self.GuardHitAnimation = "tam_guard_hit"
	elseif self.Iha then
	self.ShiftIdleAnimation = "iha_shift_idle"
	self.ShiftAnimation = "iha_shift"
	self.ShiftRunAnimation = "iha_run"
	self.SwayBackAnimation = "iha_sway_b"
	self.SwayForwardAnimation = "iha_sway_f"
	self.SwayRightAnimation = "iha_sway_r"
	self.SwayLeftAnimation = "iha_sway_l"
	self.GuardStartAnimation = "iha_guard_st"
	self.GuardLoopAnimation = "iha_guard_lp"
	self.GuardEndAnimation = "iha_guard_en"
	self.GuardHitAnimation = "iha_guard_hit"
	elseif self.Tnn then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "tnn_shift_idle"
	self.ShiftAnimation = "tnn_shift"
	self.ShiftRunAnimation = "tnn_run"
	self.SwayBackAnimation = "tnn_sway_b"
	self.SwayForwardAnimation = "tnn_sway_f"
	self.SwayRightAnimation = "tnn_sway_r"
	self.SwayLeftAnimation = "tnn_sway_l"
	self.GuardStartAnimation = "tnn_guard_st"
	self.GuardLoopAnimation = "tnn_guard_lp"
	self.GuardEndAnimation = "tnn_guard_en"
	self.GuardHitAnimation = "tnn_guard_hit"
	elseif self.Rik then
	self.ShiftIdleAnimation = "rik_shift_idle"
	self.ShiftAnimation = "rik_shift"
	self.ShiftRunAnimation = "rik_run"
	self.SwayBackAnimation = "rik_sway_b"
	self.SwayForwardAnimation = "rik_sway_f"
	self.SwayRightAnimation = "rik_sway_r"
	self.SwayLeftAnimation = "rik_sway_l"
	self.GuardStartAnimation = "rik_guard_st"
	self.GuardLoopAnimation = "rik_guard_lp"
	self.GuardEndAnimation = "rik_guard_en"
	self.GuardHitAnimation = "rik_guard_hit"
	elseif self.Yah then
	self.AttackArmor = true
	self.ShiftIdleAnimation = "yah_shift_idle"
	self.ShiftAnimation = "yah_shift"
	self.ShiftRunAnimation = "yah_run"
	self.SwayBackAnimation = "yah_sway_b"
	self.SwayForwardAnimation = "yah_sway_f"
	self.SwayRightAnimation = "yah_sway_r"
	self.SwayLeftAnimation = "yah_sway_l"
	self.GuardStartAnimation = "yah_guard_st"
	self.GuardLoopAnimation = "yah_guard_lp"
	self.GuardEndAnimation = "yah_guard_en"
	self.GuardHitAnimation = "yah_guard_hit"
	elseif self.Smg then
	self:DrawWeapon()
	self.RangeAttackRange = 750
	self.CanRangeAttack = true
	self.RangeAtkCooldown1 = 30
	self.RangeAtkCooldown2 = 30
	self.ShiftIdleAnimation = "tlk_handhip1"
	self.ShiftAnimation = "smg_shift"
	self.ShiftRunAnimation = "smg_run"
	self.GuardStartAnimation = "smg_guard_st"
	self.GuardLoopAnimation = "smg_guard_lp"
	self.GuardEndAnimation = "smg_guard_en"
	self.GuardHitAnimation = "smg_guard_hit"
	elseif self.Kuz then
	self.ShiftIdleAnimation = "kuz_shift_idle"
	self.ShiftAnimation = "kuz_shift"
	self.ShiftRunAnimation = "kuz_run"
	self.SwayBackAnimation = "kuz_sway_b"
	self.SwayForwardAnimation = "kuz_sway_f"
	self.SwayRightAnimation = "kuz_sway_r"
	self.SwayLeftAnimation = "kuz_sway_l"
	self.GuardStartAnimation = "kuz_guard_st"
	self.GuardLoopAnimation = "kuz_guard_lp"
	self.GuardEndAnimation = "kuz_guard_en"
	self.GuardHitAnimation = "kuz_guard_hit"
	elseif self.Knd then
	self.ShiftIdleAnimation = "knd_shift_idle"
	self.ShiftAnimation = "knd_shift"
	self.ShiftRunAnimation = "run"
	self.GuardStartAnimation = "knd_guard_st"
	self.GuardLoopAnimation = "knd_guard_lp"
	self.GuardEndAnimation = "knd_guard_en"
	self.GuardHitAnimation = "knd_guard_hit"
	elseif self.Ryu0 then
	self.ShiftIdleAnimation = "rik_shift_idle"
	self.ShiftAnimation = "rik_shift"
	self.ShiftRunAnimation = "rik_run"
	elseif self.Dgo then
	self.ShiftIdleAnimation = "dgo_shift_idle"
	self.ShiftAnimation = "dgo_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "dgo_sway_b"
	self.SwayForwardAnimation = "dgo_sway_f"
	self.SwayRightAnimation = "dgo_sway_r"
	self.SwayLeftAnimation = "dgo_sway_l"
	self.GuardStartAnimation = "dgo_guard_st"
	self.GuardLoopAnimation = "dgo_guard_lp"
	self.GuardEndAnimation = "dgo_guard_en"
	self.GuardHitAnimation = "dgo_guard_hit"
	self.SyncCounterStartAnimation = "dgo_nage_air_stand_st"
	self.SyncCounterLoopAnimation = "dgo_nage_air_stand_lp"
	self.SyncCounterEndAnimation = "dgo_nage_air_stand_en"
	self.SyncCounterAnimation = "dgo_nage_air_sync"
	self.Sync1CounterAnimation = "dgo_nage_air_sync1"
	elseif self.Iwa then
	self.ShiftIdleAnimation = "iwa_shift_idle"
	self.ShiftAnimation = "iwa_shift"
	self.ShiftRunAnimation = "iwa_run"
	self.SwayBackAnimation = "iwa_sway_b"
	self.SwayForwardAnimation = "iwa_sway_f"
	self.SwayRightAnimation = "iwa_sway_r"
	self.SwayLeftAnimation = "iwa_sway_l"
	self.GuardStartAnimation = "iwa_guard_st"
	self.GuardLoopAnimation = "iwa_guard_lp"
	self.GuardEndAnimation = "iwa_guard_en"
	self.GuardHitAnimation = "iwa_guard_hit"
	elseif self.Pipe or self.Baton then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "batton_shift_idle"
	self.ShiftAnimation = "lumb_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "batton_sway_b"
	self.SwayForwardAnimation = "batton_sway_f"
	self.SwayRightAnimation = "batton_sway_r"
	self.SwayLeftAnimation = "batton_sway_l"
	self.GuardStartAnimation = "lumb_guard_st"
	self.GuardLoopAnimation = "lumb_guard_lp"
	self.GuardEndAnimation = "lumb_guard_en"
	self.GuardHitAnimation = "lumb_guard_hit"
	elseif self.Sai then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "sai_shift_idle"
	self.ShiftAnimation = "sai_shift"
	self.ShiftRunAnimation = "sai_run"
	self.SwayBackAnimation = "sai_sway_b"
	self.SwayForwardAnimation = "sai_sway_f"
	self.SwayRightAnimation = "sai_sway_r"
	self.SwayLeftAnimation = "sai_sway_l"
	self.GuardStartAnimation = "sai_guard_st"
	self.GuardLoopAnimation = "sai_guard_lp"
	self.GuardEndAnimation = "sai_guard_en"
	self.GuardHitAnimation = "sai_guard_hit"
	elseif self.Tonfa then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "oda_shift_idle_blend"
	self.ShiftAnimation = "oda_shift"
	self.ShiftRunAnimation = "oda_run"
	self.SwayBackAnimation = "oda_sway_b"
	self.SwayForwardAnimation = "oda_sway_f"
	self.SwayRightAnimation = "oda_sway_r"
	self.SwayLeftAnimation = "oda_sway_l"
	self.GuardStartAnimation = "oda_guard_st"
	self.GuardLoopAnimation = "oda_guard_lp"
	self.GuardEndAnimation = "oda_guard_en"
	self.GuardHitAnimation = "oda_guard_hit"
	elseif self.Oda then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "oda_shift_idle"
	self.ShiftAnimation = "oda_shift"
	self.ShiftRunAnimation = "oda_run"
	self.SwayBackAnimation = "oda_sway_b"
	self.SwayForwardAnimation = "oda_sway_f"
	self.SwayRightAnimation = "oda_sway_r"
	self.SwayLeftAnimation = "oda_sway_l"
	self.GuardStartAnimation = "oda_guard_st"
	self.GuardLoopAnimation = "oda_guard_lp"
	self.GuardEndAnimation = "oda_guard_en"
	self.GuardHitAnimation = "oda_guard_hit"
	elseif self.Pow then
	self:DrawWeapon()
	self.Armor = true
	self.SuperArmor = true
	self.ShiftIdleAnimation = "pow_shift_idle"
	self.ShiftAnimation = "pow_shift"
	self.ShiftRunAnimation = "pow_run"
	self.SwayBackAnimation = "pow_sway_b"
	self.SwayForwardAnimation = "pow_sway_f"
	self.SwayRightAnimation = "pow_atk_dodge_r"
	self.SwayLeftAnimation = "pow_atk_dodge_l"
	self.GuardStartAnimation = "pow_guard_st"
	self.GuardLoopAnimation = "pow_guard_lp"
	self.GuardEndAnimation = "pow_guard_en"
	self.GuardHitAnimation = "pow_guard_hit"
	elseif self.Dat then
	self.ShiftIdleAnimation = "dat_shift_idle"
	elseif self.Lee then
	self.ShiftIdleAnimation = "lee_shift_idle"
	self.ShiftAnimation = "lee_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "lee_sway_b"
	self.SwayForwardAnimation = "lee_sway_f"
	self.SwayRightAnimation = "lee_sway_r"
	self.SwayLeftAnimation = "lee_sway_l"
	self.GuardStartAnimation = "lee_guard_st"
	self.GuardLoopAnimation = "lee_guard_lp"
	self.GuardEndAnimation = "lee_guard_en"
	self.GuardHitAnimation = "lee_guard_hit"
	elseif self.Golf then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "golf_shift_idle"
	self.ShiftAnimation = "golf_shift"
	self.GuardStartAnimation = "golf_guard_st"
	self.GuardLoopAnimation = "golf_guard_lp"
	self.GuardEndAnimation = "golf_guard_en"
	self.GuardHitAnimation = "golf_guard_hit"
	elseif self.RicGun then
	self:DrawWeapon()
	self.CanRangeAttack = true
	self.RangeAtkCooldown1 = 5
	self.RangeAtkCooldown2 = 15
	self.ShiftIdleAnimation = "tlk_handhip1"
	self.ShiftAnimation = "gor_shift"
	self.ShiftRunAnimation = "ric_gun_run"
	self.SwayBackAnimation = "ric_gun_sway_b"
	self.SwayForwardAnimation = "ric_gun_sway_f"
	self.SwayRightAnimation = "ric_gun_sway_r"
	self.SwayLeftAnimation = "ric_gun_sway_l"
	self.GuardStartAnimation = "ric_gun_guard_st"
	self.GuardLoopAnimation = "ric_gun_guard_lp"
	self.GuardEndAnimation = "ric_gun_guard_en"
	self.GuardHitAnimation = "ric_gun_guard_hit"
	elseif self.Kaz then
	self.ShiftIdleAnimation = "kaz_shift_idle"
	self.ShiftAnimation = "kaz_shift"
	self.ShiftRunAnimation = "kaz_run"
	self.SwayBackAnimation = "kaz_sway_b"
	self.SwayForwardAnimation = "kaz_sway_f"
	self.SwayRightAnimation = "kaz_sway_r"
	self.SwayLeftAnimation = "kaz_sway_l"
	self.GuardStartAnimation = "kaz_guard_st"
	self.GuardLoopAnimation = "kaz_guard_lp"
	self.GuardEndAnimation = "kaz_guard_en"
	self.GuardHitAnimation = "kaz_guard_hit"
	elseif self.Ric then
	self.ShiftIdleAnimation = "ric_shift_idle"
	self.ShiftAnimation = "ric_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "ric_sway_b"
	self.SwayForwardAnimation = "ric_sway_f"
	self.SwayRightAnimation = "ric_sway_r"
	self.SwayLeftAnimation = "ric_sway_l"
	self.GuardStartAnimation = "ric_guard_st"
	self.GuardLoopAnimation = "ric_guard_lp"
	self.GuardEndAnimation = "ric_guard_en"
	self.GuardHitAnimation = "ric_guard_hit"
	elseif self.Kzk then
	self.ShiftIdleAnimation = "kzk_shift_idle"
	self.ShiftAnimation = "box_shift"
	elseif self.Yuy then
	self.ShiftIdleAnimation = "yuy_shift_idle"
	elseif self.GunB then
	self:DrawWeapon()
	self.RangeAttackRange = 750
	self.CanRangeAttack = true
	self.RangeAtkCooldown1 = 10
	self.RangeAtkCooldown2 = 20
	self.ShiftIdleAnimation = "gun_b_shift_idle"
	self.ShiftAnimation = "gun_b_shift"
	self.SwayBackAnimation = "gun_b_sway_b"
	self.SwayForwardAnimation = "gun_b_sway_f"
	self.SwayRightAnimation = "gun_b_sway_r"
	self.SwayLeftAnimation = "gun_b_sway_l"
	self.GuardStartAnimation = "gun_b_guard_st"
	self.GuardLoopAnimation = "gun_b_guard_lp"
	self.GuardEndAnimation = "gun_b_guard_en"
	self.GuardHitAnimation = "gun_b_guard_hit"
	elseif self.Wpg then
	self:DrawWeapon()
	self.Armor = true
	self.AttackSuperArmor = true
	self.NoDodge = true
	self.ShiftIdleAnimation = "wpg_shift_idle"
	self.ShiftAnimation = "wpg_shift"
	self.ShiftRunAnimation = "wpg_hammer_run"
	self.GuardStartAnimation = "wpg_guard_st"
	self.GuardLoopAnimation = "wpg_guard_lp"
	self.GuardEndAnimation = "wpg_guard_en"
	self.GuardHitAnimation = "wpg_guard_hit"
	elseif self.WpgHammer then
	self:DrawWeapon()
	self.AttackArmor = true
	self.NoDodge = true
	self.ShiftIdleAnimation = "wpg_hammer_shift_idle"
	self.ShiftAnimation = "wpg_hammer_shift"
	self.ShiftRunAnimation = "wpg_hammer_run"
	self.GuardStartAnimation = "wpg_hammer_guard_st"
	self.GuardLoopAnimation = "wpg_hammer_guard_lp"
	self.GuardEndAnimation = "wpg_hammer_guard_en"
	self.GuardHitAnimation = "wpg_hammer_guard_hit"
	elseif self.Gng then
	self.ShiftIdleAnimation = "gng_shift_idle"
	self.ShiftAnimation = "gng_shift"
	elseif self.Cap then
	self.ShiftIdleAnimation = "cap_shift_idle"
	self.ShiftAnimation = "cap_shift"
	self.ShiftRunAnimation = "run"
	self.SwayBackAnimation = "cap_sway_b"
	self.SwayForwardAnimation = "cap_sway_f"
	self.SwayRightAnimation = "cap_sway_r"
	self.SwayLeftAnimation = "cap_sway_l"
	self.GuardStartAnimation = "cap_guard_st"
	self.GuardLoopAnimation = "cap_guard_lp"
	self.GuardEndAnimation = "cap_guard_en"
	self.GuardHitAnimation = "cap_guard_hit"
	elseif self.FWPC then
	self.Armor = true
	self.SuperArmor = true
	self.NoDodge = true
	self.NoMove = true
	self.NoGuard = true
	self.ShiftIdleAnimation = "fat_wpc_shift_idle"
	self.ShiftAnimation = "fat_wpc_shift_idle"
	self.ShiftRunAnimation = "fat_wpc_shift_idle"
	elseif self.WPH then
	self.NoDodge = true
	self.ShiftIdleAnimation = "stool_shift_idle"
	self.ShiftAnimation = "stool_shift"
	self.ShiftRunAnimation = "stool_run"
	self.GuardStartAnimation = "stool_guard_st"
	self.GuardLoopAnimation = "stool_guard_lp"
	self.GuardEndAnimation = "stool_guard_en"
	self.GuardHitAnimation = "stool_guard_hit"
	elseif self.ThrowKnife then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "atk_knife_throw_lp"
	self.ShiftAnimation = "atk_knife_throw_lp"
	self.ShiftRunAnimation = "atk_knife_throw_lp"
	elseif self.ThrowBomb then
	self:DrawWeapon()
	self.ShiftIdleAnimation = "atk_bomb_throw_lp"
	self.ShiftAnimation = "atk_bomb_throw_lp"
	self.ShiftRunAnimation = "atk_bomb_throw_lp"
	end
	self.IdleAnimation = self.ShiftIdleAnimation
	self.WalkAnimation = self.ShiftAnimation
	self.RunAnimation = self.ShiftRunAnimation
end
function ENT:Yakuza_Range(enemy)
	
	self:PlaySequenceAndMove("",1,function(self,cycle)
		if cycle < 0.25 then self:FaceEnemy() end
	end)
end
  function ENT:OnRangeAttack(enemy)
	if self.Blocking then return end
	if self.Combat == false and self.ReadyCombat then
	self.Combat = true
	self:FaceInstant(enemy)
	local ent = enemy
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3") and not ent.Combat and not ent.Downed and not ent.HeatAction and self.DynamicIntro then
	ent.HeatAction = true
	ent.Downed = true
	self.Downed = true
	self.HeatAction = true
	ent.Attacking = false
	ent.Dodging = false
	ent:Stance()
	self:Stance()
	ent.Combat = true
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		if ent:IsPossessed() then
		local ply = ent:GetPossessor()
		self.enemyplayer = ply
		self.enemyplayer:SetFOV(36+5,1,self)
		ent:Dispossess()
		ent:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(ent:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(ent:GetAngles())
		if self.MoneyBeggar then
		self.Camera:ResetSequence("hey_you_whats_up_man_give_me_money_please_cam")
		elseif self.Fatso then
		self.Camera:ResetSequence("btlst_big_cam")
		elseif self.Bat or self.Golf then
		self.Camera:ResetSequence("btlst_bat_cam")
		elseif self.Yop then
		self.Camera:ResetSequence("btlst_ypp_cam")
		else
		self.Camera:ResetSequence("btlst_katsuage_cam")
		end
		self.Cam = ents.Create("prop_physics")
		self.Cam:SetModel("models/dav0r/camera.mdl")
		self.Cam:DrawShadow(false)
		self.Cam:SetRenderMode(1)
		self.Cam:SetColor(Color(255, 255, 255, 0))
		self.Cam:SetMoveType( MOVETYPE_NONE )
		self.Cam:SetParent(self.Camera)
		self.Cam:Fire("setparentattachment","camera")
		self.Cam:SetPos(self.Camera:GetPos())
		self.Cam:SetNotSolid(true)
		self.Cam:Spawn()
		self.Cam:SetAngles(Angle(self.Camera:GetAngles().x, self.Camera:GetAngles().y, self.Camera:GetAngles().z))
		ply:SetViewEntity(self.Cam)
		ply:SetNoDraw(true)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		end
		if self.MoneyBeggar then
		ent:PlaySequenceAndMoveAbsolute("hey_you_whats_up_man_give_me_money_please_sync")
		elseif self.Fatso then
		ent:PlaySequenceAndMoveAbsolute("btlst_big_sync1")
		elseif self.Bat or self.Golf then
		ent:PlaySequenceAndMoveAbsolute("btlst_bat_sync1")
		elseif self.Yop then
		ent:PlaySequenceAndMoveAbsolute("btlst_ypp_sync1")
		else
		ent:PlaySequenceAndMoveAbsolute("btlst_katsuage_sync1")
		end
		if IsValid(self.Camera) then
		self.enemyplayer:SetFOV(0,0.5,self)
		ent:SetPossessionEnabled(true)
		self.enemyplayer:Freeze(false)
		self.enemyplayer:GodDisable()
		self.enemyplayer:SetNoDraw(false)
		self.enemyplayer:SetViewEntity(ply)
		ent:Possess(self.enemyplayer)
		self.Cam:Remove()
		self.Camera:Remove()
		end
		ent.Downed = false
		ent.HeatAction = false
		end)
		local col = self:GetCollisionGroup()
		self.Damage = 30
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.MoneyBeggar then
		self:PlaySequenceAndMoveAbsolute("hey_you_whats_up_man_give_me_money_please_sync1")
		elseif self.Fatso then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_big.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_big_sync")
		elseif self.Bat or self.Golf then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_bat.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_bat_sync")
		elseif self.Yop then
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_ypp.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_ypp_sync")
		else
		filter = RecipientFilter()
		filter:AddAllPlayers()
		self.SFX = CreateSound(game.GetWorld(),"yakuza0/goons/btlst_katsuage.wav", filter)
		self.SFX:SetSoundLevel(0)
		self.SFX:Play()
		self:PlaySequenceAndMoveAbsolute("btlst_katsuage_sync")
		end
		if self.SFX then 
		self.SFX:Stop()
		end
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
	elseif self.BattleStart then
	self:Stance()
	if self.Boss then
		self:Timer(3,function()
			if #self.StartSounds > 0 then
				self:EmitSound(self.StartSounds[math.random(#self.StartSounds)])
			end
		end)
	end
		if self.StanceBattleStart then
			self:Timer(6,function()
				self.IdleStarter = false
			end)
			self.IdleStarter = true
		else
			self:PlaySequenceAndMove(self.BattleStartAnimation,1)
		end
	else
	if self.A then
	self:PlaySequenceAndMove("enc_run_a_stop",1)
	if self.Bat or self.Golf then
	self:PlaySequenceAndMove("enc_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana or self.Tnn then
	self:PlaySequenceAndMove("enc_lumb_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun or self.Smg then
	self:PlaySequenceAndMove("enc_gun_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Pipe or self.Baton or self.Sai or self.Tonfa then
	self:PlaySequenceAndMove("enc_batton_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Wpg or self.WpgHammer then
	self:PlaySequenceAndMove("enc_wpg_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.GunB then
	self:PlaySequenceAndMove("enc_gun_b_battou_a",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	elseif self.B then
	self:PlaySequenceAndMove("enc_run_b_stop",1)
	if self.Bat or self.Golf then
	self:PlaySequenceAndMove("enc_bat_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife or self.Taser then
	self:PlaySequenceAndMove("enc_knife_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Knife2 then
	self:PlaySequenceAndMove("enc_knife2_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.JkS then
	self:PlaySequenceAndMove("enc_jak_sword_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Katana or self.WKatana or self.Tnn then
	self:PlaySequenceAndMove("enc_lumb_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Gun or self.Shotgun or self.Smg then
	self:PlaySequenceAndMove("enc_gun_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.FBat then
	self:PlaySequenceAndMove("enc_fat_bat_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Pipe or self.Baton or self.Sai or self.Tonfa then
	self:PlaySequenceAndMove("enc_batton_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.Wpg or self.WpgHammer then
	self:PlaySequenceAndMove("enc_wpg_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.GunB then
	self:PlaySequenceAndMove("enc_gun_b_battou_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("enc_run_stop_back"..math.random(8),1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	end
	end
	self:Stance()
	end
	if self:GetCooldown("YopDrink")<=0 and not self.Zombie and self.Yop and self.Combat then
	self:SetCooldown("YopDrink", math.random(10,30))
	if math.random(3)==2 then
	self:PlaySequenceAndMove("yop_drink_st",1)
	end
	end
	if self:GetCooldown("Ranger")<=0 and self.CanRangeAttack and not enemy.Downed and self.Combat then
	self:SetCooldown("Ranger",math.random(self.RangeAtkCooldown1,self.RangeAtkCooldown2))
	if self.Shotgun then
	if math.random(2) == 1 then
	self:PlaySequenceAndMove("shotgun_atk_shot_low",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("shotgun_atk_shot_hi",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	end
	elseif self.Smg then
	if math.random(2) == 1 then
	self:PlaySequenceAndMove("smg_atk_shot",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("smg_atk_shot_around",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	end
	elseif self.GunB or self.RicGun then
	if math.random(3) == 2 then
		if math.random(2)==1 then
			self:PlaySequenceAndMove("gun_b_atk_dodge_shot_l",1)
		else
			self:PlaySequenceAndMove("gun_b_atk_dodge_shot_r",1)
		end
	else
	self:PlaySequenceAndMove("gun_b_atk_shot_hi",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	end
	elseif self.ThrowKnife then
		self:PlaySequenceAndMove("atk_knife_throw_en",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.ThrowKnifeLower then
		self.ThrowKnife = true
		self.ThrowKnifeLower = false
		self.NoMove = true
		self.NoGuard = true
		self.NoDodge = true
		self:Stance()
		self:PlaySequenceAndMove("atk_knife_throw_st",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.ThrowBomb then
		self:PlaySequenceAndMove("atk_bomb_throw_en",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif self.ThrowBombLower then
		self.ThrowBomb = true
		self.ThrowBombLower = false
		self.NoMove = true
		self.NoGuard = true
		self.NoDodge = true
		self:Stance()
		self:PlaySequenceAndMove("atk_bomb_throw_st",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	else
	if math.random(2) == 1 then
	self:PlaySequenceAndMove("gun_atk_shot_low",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	else
	self:PlaySequenceAndMove("gun_atk_shot_mid",1,function(self,cycle)if cycle < 0.15 then self:FaceEnemy() end end)
	end
	end
	end
	if self:GetCooldown("SyncCounterCooldown")<=0 and self.CanSyncCounter and not self.SyncCounter then
	if math.random(3)==1 then
	self:PlaySequenceAndMove(self.SyncCounterStartAnimation,1)
	self:SetCooldown("SyncCounterCooldown",math.random(10,20))
	else
	self:SetCooldown("SyncCounterCooldown",math.random(5,10))
	end
	end
	if self:GetCooldown("Yakuza_"..self:GetClass().."_Strafe") >0 then return end

	local mdirection = math.random(5)
	if mdirection == 4 or self.Aggressor then
		self:Yakuza_Range(enemy)
	else
		self:Yakuza_Strafe(enemy,mdirection)
	end
	self:SetCooldown("Yakuza_"..self:GetClass().."_Strafe", math.random(1,2))
end
function ENT:OnRemove()
	if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
	end
end
function ENT:Yakuza_Strafe(enemy,mdirection)
	if mdirection == 1 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:GetCooldown("GoonAttack")<=0 and self:IsInRange(enemy,self.MeleeAttackRange) or self.CanRangeAttack and self:GetCooldown("Ranger")<=0 and self:IsInRange(enemy,self.RangeAttackRange) then return true end
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 2 then
		self:MoveLeft(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:GetCooldown("GoonAttack")<=0 and self:IsInRange(enemy,self.MeleeAttackRange) or self.CanRangeAttack and self:GetCooldown("Ranger")<=0 and self:IsInRange(enemy,self.RangeAttackRange) then return true end
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 3 then
		self:MoveRight(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:GetCooldown("GoonAttack")<=0 and self:IsInRange(enemy,self.MeleeAttackRange) or self.CanRangeAttack and self:GetCooldown("Ranger")<=0 and self:IsInRange(enemy,self.RangeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
		elseif mdirection == 4 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:GetCooldown("GoonAttack")<=0 and self:IsInRange(enemy,self.MeleeAttackRange) or self.CanRangeAttack and self:GetCooldown("Ranger")<=0 and self:IsInRange(enemy,self.RangeAttackRange) then return true end
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
		elseif mdirection == 5 then
		self.Stay = true
		self:SetCooldown("StayD",math.random(3,7))
	end
end
function ENT:GrabRelease()
	if self.Yop then
	local ent = self.Target
	self.HeatAction = true
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	self.HeatAction = true
	ent.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self:SetPos(self:GetPos())
	self:SetAngles(self:GetAngles())
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self.Damage = 30
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("yop_grab_f_en_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("yop_grab_f_en_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	elseif self.Iwa then
	local ent = self.Target
	self.HeatAction = true
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	self.HeatAction = true
	ent.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self:SetPos(self:GetPos())
	self:SetAngles(self:GetAngles())
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self.Damage = 30
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("iwa_necklock_en_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("iwa_necklock_en_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	end
end
function ENT:OnDealtDamage(ent, dmg)
	if ent:IsNextBot() then
	if string.find(ent:GetClass(), "drg_scot_*") and ent:IsInFaction("FACTION_YAKUZA") and self:IsInFaction("FACTION_YAKUZA") and GetConVarNumber("drg_yakuza_ff") == 0 then
	dmg:SetDamage(0)
	end
	if string.find(ent:GetClass(), "drg_scot_*") and ent:IsInFaction("FACTION_SEEKER") and self:IsInFaction("FACTION_SEEKER") and GetConVarNumber("drg_yakuza_ff") == 0 then
	dmg:SetDamage(0)
	end
	end
	if self.Sync and not ent.Downed and dmg:GetDamage() > 0 then
	self.Sync = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" or (ent.Category == "Yakuza Minigames" and not ent.Cant) then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove(self.SyncFAnimation)
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove(self.Sync1FAnimation)
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove(self.SyncBAnimation)
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove(self.Sync1BAnimation)
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.MSKRN and not ent.Downed then
	self.MSKRN = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("msk_atk_run_nage_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("msk_atk_run_nage_f_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("msk_atk_run_nage_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("msk_atk_run_nage_b_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.YOPSZ and not ent.Downed then
	self.YOPSZ = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("yop_grab_f_st_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent.Grabber = self
		ent:PlaySequenceAndMove("yop_grab_f_st_sync1")
		ent.Grabbed = true
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("yop_grab_b_st_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent.Grabber = self
		ent:PlaySequenceAndMove("yop_grab_b_st_sync1")
		ent.Grabbed = true
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.IWANL and not ent.Downed then
	self.IWANL = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("iwa_necklock_st_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos()+self:GetRight()*-5)
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent.Grabber = self
		ent:PlaySequenceAndMove("iwa_necklock_st_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	end
	if self.RICSP and not ent.Downed then
	self.RICSP = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("ric_cmbsp02_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("ric_cmbsp02_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	end
	if self.AIZSP and not ent.Downed then
	self.AIZSP = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("aiz_cmbsp_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("aiz_cmbsp_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	end
end
function ENT:GlassesInit()
	if self.Muscle then
	self.GlasMod = "models/scot/yakuza0/glasses_mus.mdl"
	elseif self.Fatso then
	self.GlasMod = "models/scot/yakuza0/glasses_fat.mdl"
	else
	self.GlasMod = "models/scot/yakuza0/glasses.mdl"
	end
	self.GlassPos = ents.Create("prop_physics")
	self.GlassPos:SetModel("models/props_lab/huladoll.mdl")
	self.GlassPos:Spawn()
	self.GlassPos:SetNotSolid(true)
	self.GlassPos:SetNoDraw(true)
	self.GlassPos:SetParent(self)
	self.GlassPos:Fire("setparentattachment","face")
	self.Glassess = ents.Create("prop_physics")
	self.Glassess:SetModel(self.GlasMod)
	self.Glassess:Spawn()
	self.Glassess:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self.Glassess:SetNotSolid(true)
	self.Glassess:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self.Glassess:SetModelScale(self:GetModelScale())
	self.Glassess:SetParent(self.GlassPos)
	self.Glassess:SetAngles(self.Glassess:GetAngles()+Angle(0,0,-37.5))
	self.Glassess:SetPos(self.Glassess:GetPos()+self.Glassess:GetRight()*-0.3+self.Glassess:GetUp()*-0.35)
	if not self.SunGlasses then
		if self.Nerd then
			self.Glassess:SetSkin(math.random(0,2))
		else
			self.Glassess:SetSkin(math.random(0,1))
		end
	end
	if self.B10A or self.B30BMus or self.B30AFat then
	self.Glassess:SetBodygroup(0,0)
	elseif self.B20A or self.B30CMus or self.B30CFat then
	self.Glassess:SetBodygroup(0,1)
	elseif self.B30A or self.B30DMus then
	self.Glassess:SetBodygroup(0,2)
	elseif self.B30B or self.B30EMus then
	self.Glassess:SetBodygroup(0,3)
	elseif self.B30C or self.B30FMus then
	self.Glassess:SetBodygroup(0,4)
	elseif self.B40A or self.B30GMus then
	self.Glassess:SetBodygroup(0,5)
	elseif self.B40B then
	self.Glassess:SetBodygroup(0,6)
	elseif self.B40C then
	self.Glassess:SetBodygroup(0,7)
	elseif self.B40D then
	self.Glassess:SetBodygroup(0,8)
	elseif self.B50A then
	self.Glassess:SetBodygroup(0,9)
	else
	SafeRemoveEntity(self.Glassess)
	SafeRemoveEntity(self.GlassPos)
	end
end
function ENT:GlassesFall()
	local pos = self.Glassess:GetPos()
	self.Glassess:SetParent(nill)
	self.Glassess:SetPos(pos)
	self.Glassess:SetNotSolid(false)
	self.Glassess:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	local phys = self.Glassess:GetPhysicsObject()
	phys:Wake()
	if IsValid(self.LastAttacker) then
	self.uppi = self.LastAttacker
	phys:SetVelocity( self:GetUp() * 200 + self.uppi:GetForward() * 200 )
	else
	self.uppi = self
	phys:SetVelocity( self:GetUp() * 200 + self.uppi:GetForward() * -200 )
	end
	phys:AddAngleVelocity( Vector( math.random(1000,0), math.random(500,-500), math.random(500,-500) ) )
	SafeRemoveEntityDelayed(self.Glassess,10)
	SafeRemoveEntity(self.GlassPos)
end
function ENT:OnTakeDamage(dmg)
   if self:IsDead() then return end
	if self.FWPC and dmg:GetAttacker().HeatAction and not self.Exception and self.HeatAction then
		dmg:ScaleDamage(3)
	end
   if not dmg:IsDamageType(DMG_BLAST) and not self.Downed and self.Dodge == true and self.Attacking == false then
   dmg:SetDamage(0)
   end
	if self.SyncCounter and not self.Downed then
	dmg:SetDamage(0)
	dmg:SetDamageType(DMG_DISSOLVE)
	self.SyncCounter = false
	local ent = dmg:GetAttacker()
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	self.HeatAction = true
	ent.HeatAction = true
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self.Damage = 30
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove(self.SyncCounterAnimation)
		self.HeatAction = false
		self:SetCooldown("SyncCounter",math.random(10,20))
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove(self.Sync1CounterAnimation)
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	else
		self:CICO(function(self)
		self:PlaySequenceAndMoveAbsolute(self.CounterEndAnimation)
		self:SetCooldown("SyncCounter",math.random(10,20))
		end)
	end
	end
	if (not dmg:IsDamageType(DMG_SLASH) and not dmg:IsDamageType(DMG_BLAST) and not dmg:IsDamageType(DMG_DIRECT) and not dmg:IsDamageType(DMG_DISSOLVE) and not dmg:IsBulletDamage()) and not self:IsPossessed() and not self.Stunned and not self.Downed and not self.Downing and not self.NoGuard and math.random(20)==10 and self:GetCooldown("CanBlock")<=0 and not self.Blocking then
		self.Blocking = true
		self.GuardHP = 100
		self:SetCooldown("Block",math.random(3,5))
   		self:CICO(function()
		self:PlaySequenceAndMove(self.GuardStartAnimation,1)
		end)
	end
	if (not dmg:IsDamageType(DMG_SLASH) and not dmg:IsDamageType(DMG_BLAST) and not dmg:IsDamageType(DMG_DIRECT) and not dmg:IsDamageType(DMG_DISSOLVE) and not dmg:IsBulletDamage()) and not self.Stunned and not self.Downed and not self.Downing and self.Blocking then
		if dmg:GetAttacker().GuardBreak then
		self.GuardHP = math.min(200,self.GuardHP - self.GuardHP)
		else
		self.GuardHP = math.min(200,self.GuardHP - dmg:GetDamage())
		end
			if IsValid(dmg:GetAttacker()) then
				self:FaceInstant(dmg:GetAttacker():GetPos())
			else
				self:FaceInstant(dmg:GetReportedPosition())
			end
		dmg:SetDamage(0)
		self:SetCooldown("Block",self:GetCooldown("Block")+1)
			if self:GetCooldown("Block") > 5 then
			self:SetCooldown("Block",5)
			end
			if self.GuardHP > 1 then
		self:CICO(function(self)
		if #self.WeaponGuardSounds > 0 then
			self:EmitSound(self.WeaponGuardSounds[math.random(#self.WeaponGuardSounds)])
		else
		self:EmitSound("weapons/fists/guard"..math.random(3)..".wav",85)
		end
		self:PlaySequenceAndMove(self.GuardHitAnimation,1)
		end)
			else
		self:CICO(function(self)
			self.Blocking = false
			self.Flinching = true
			self:EmitSound("common/guard_break.wav",85)
			self:PlaySequenceAndMove("guard_break",1)
			self:Feare()
			self.Flinching = false
		end)
			end
	end
	if not (self.AttackSuperArmor and self.CantDodge) and not self.SuperArmor then
	if not self.Downed and (dmg:IsDamageType(DMG_FALL) or (self.Downing and (dmg:GetDamageType() == 0 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin) or dmg:GetDamageType() == 128)) or (self.StandingUp and not (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 4 or dmg:GetDamageType() == 32 or dmg:GetDamageType() == 128))) and not self.CantFall and not self.HeatAction and not dmg:IsDamageType(DMG_BURN) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			self:AttackReset()
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(2),1)
			end
			else
			self:PlaySequenceAndMove("down_standup_f",1)
			end
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			self:AttackReset()
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
			end
			else
			self:PlaySequenceAndMove("down_standup_b",1)
			end
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			self:AttackReset()
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(2),1)
			end
			else
			self:PlaySequenceAndMove("down_standup_l",1)
			end
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			self:AttackReset()
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl1_f"..math.random(2),1)
			end
			else
			self:PlaySequenceAndMove("down_standup_r",1)
			end
		end)
		end
	elseif not self.Downed and dmg:IsBulletDamage() and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local man = dmg:GetAttacker()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			self:PlaySequenceAndMove("down_fatal_f_st",1)
			end
			self.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			self.CantFall = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_b",1)
			end
			else
			self:PlaySequenceAndMove("down_fatal_b_st",1)
			end
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_BLAST) and not self.DownSafety then
		self.DownSafety = true
		dmg:ScaleDamage(2)
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_explode_f",1)
			self:AttackReset()
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_explode_b",1)
			self:AttackReset()
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_explode_l",1)
			self:AttackReset()
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_explode_r",1)
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_CRUSH) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if (dmer.NoDown or self.CantDowned) and not (dmer.Stun and not self.Stunned) then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_push_f",1)
			end
			elseif dmer.Stun and not self.Downing and dmer.NoDown and not self.Stunned then
			self.Downed = false
			self.Downing = false
			self.Stunned = true
			if IsValid(self.StunFX) then
				self.StunFX:Remove()
			end
				self.StunFX = ents.Create("obj_yakuza_heat")
				self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
				self.StunFX:Spawn()
				self.StunFX:SetParent(self)
				self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
				ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				self.Stunned = true
			self:PlaySequenceAndMove("piyori_head_f_st",1)
			self.Stunned = false
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_push_f",1)
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if (dmer.NoDown or self.CantDowned) and not (dmer.Stun and not self.Stunned) then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_push_b",1)
			end
			elseif dmer.Stun and not self.Downing and dmer.NoDown and not self.Stunned then
			self.Downed = false
			self.Downing = false
			self.Stunned = true
			if IsValid(self.StunFX) then
				self.StunFX:Remove()
			end
				self.StunFX = ents.Create("obj_yakuza_heat")
				self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
				self.StunFX:Spawn()
				self.StunFX:SetParent(self)
				self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
				ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				self.Stunned = true
			self:PlaySequenceAndMove("piyori_head_b_st",1)
			self.Stunned = false
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_push_b",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_BLAST_SURFACE) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_turn"..math.random(2),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_thumbing",1)
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_body_b",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_VEHICLE) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			if dmer.Bound then
			self:PlaySequenceAndMove("down_f_bound",1)
			elseif dmer.BoundG then
			self:PlaySequenceAndMove("down_f_bound_g",1)
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_heavy_f",1)
			end
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_b",1)
			end
			else
			if dmer.Bound then
			self:PlaySequenceAndMove("down_b_bound",1)
			elseif dmer.BoundG then
			self:PlaySequenceAndMove("down_b_bound_g",1)
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_heavy_b",1)
			end
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_SLASH) and dmg:GetInflictor().Fin and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_slash_hi_f"..math.random(2),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			if dmer.Tsuki then
			self:PlaySequenceAndMove("down_slash_tsuki_f",1)
			else
			self:PlaySequenceAndMove("down_slash_f"..math.random(3),1)
			end
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_slash_hi_b"..math.random(2),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			if dmer.Tsuki then
			self:PlaySequenceAndMove("down_slash_tsuki_b",1)
			else
			self:PlaySequenceAndMove("down_slash_b"..math.random(2),1)
			end
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_PLASMA) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_nukite",1)
			end
		end)
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_SONIC) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_slash_hi_f"..math.random(2),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_back_f",1)
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_slash_hi_b"..math.random(2),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_back_b",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_PREVENT_PHYSICS_FORCE) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if (dmer.NoDown or self.CantDowned) and not (dmer.Stun and not self.Stunned) then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_gut_f",1)
			end
			elseif dmer.Stun and not self.Downing and dmer.NoDown and not self.Stunned then
			self.Downed = false
			self.Downing = false
			self.Stunned = true
			if IsValid(self.StunFX) then
				self.StunFX:Remove()
			end
				self.StunFX = ents.Create("obj_yakuza_heat")
				self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
				self.StunFX:Spawn()
				self.StunFX:SetParent(self)
				self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
				ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				self.Stunned = true
			self:PlaySequenceAndMove("piyori_head_f_st",1)
			self.Stunned = false
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("flinch_gut_brk_f",1)
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if (dmer.NoDown or self.CantDowned) and not (dmer.Stun and not self.Stunned) then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_b",1)
			end
			elseif dmer.Stun and not self.Downing and dmer.NoDown and not self.Stunned then
			self.Downed = false
			self.Downing = false
			self.Stunned = true
			if IsValid(self.StunFX) then
				self.StunFX:Remove()
			end
				self.StunFX = ents.Create("obj_yakuza_heat")
				self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
				self.StunFX:Spawn()
				self.StunFX:SetParent(self)
				self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
				ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				self.Stunned = true
			self:PlaySequenceAndMove("piyori_head_b_st",1)
			self.Stunned = false
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("flinch_gut_brk_b",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_ALWAYSGIB) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_upr_head_f",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			if dmer.BoundG then
			self:PlaySequenceAndMove("down_upr_head_f_g",1)
			else
			self:PlaySequenceAndMove("down_upr_head_f",1)
			end
			end
			self:AttackReset()
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			if dmer.BoundG then
			self:PlaySequenceAndMove("down_upr_head_b_g",1)
			else
			self:PlaySequenceAndMove("down_upr_head_b",1)
			end
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_DIRECT) and not self.Downing and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		self.Dodge = false
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			if dmer.Kuzushi then
			self:PlaySequenceAndMove("flinch_leg_lvl1_f",1)
			else
			self:PlaySequenceAndMove("flinch_leg_lvl1_f",1)
			end
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.LegPain = true
			end
			self:PlaySequenceAndMove("down_leg_f",1)
			end
			self:AttackReset()
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			if dmer.Kuzushi then
			self:PlaySequenceAndMove("flinch_leg_lvl1_b",1)
			else
			self:PlaySequenceAndMove("flinch_leg_lvl1_b",1)
			end
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.LegPain = true
			end
			self:PlaySequenceAndMove("down_leg_b",1)
			end
			self:AttackReset()
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			if dmer.Kuzushi then
			self:PlaySequenceAndMove("flinch_leg_lvl2_l",1)
			else
			self:PlaySequenceAndMove("flinch_leg_lvl2_l",1)
			end
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.LegPain = true
			end
			self:PlaySequenceAndMove("down_leg_l",1)
			end
			self:AttackReset()
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 11 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(12,self.Flinches + 1)
			if dmer.Kuzushi then
			self:PlaySequenceAndMove("flinch_leg_lvl2_r",1)
			else
			self:PlaySequenceAndMove("flinch_leg_lvl2_r",1)
			end
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.LegPain = true
			end
			self:PlaySequenceAndMove("down_leg_r",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_AIRBOAT) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_head_f",1)
			end
			self:AttackReset()
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_head_b",1)
			end
			self:AttackReset()
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_head_l",1)
			end
			self:AttackReset()
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_head_r",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_NEVERGIB) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			if dmer.Bound then
			self:PlaySequenceAndMove("down_direct_f_bound",1)
			else
			self:PlaySequenceAndMove("down_direct_f",1)
			end
			end
			self:AttackReset()
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			if dmer.Bound then
			self:PlaySequenceAndMove("down_direct_b_bound",1)
			else
			self:PlaySequenceAndMove("down_direct_b",1)
			end
			end
			self:AttackReset()
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_direct_l",1)
			end
			self:AttackReset()
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.HeadPain = true
			end
			self:PlaySequenceAndMove("down_direct_r",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_PHYSGUN) and not self.Dodge and not self.Blocking and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
	if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
	and fwd:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_body_f",1)
			end
			self:AttackReset()
		end)
	elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
	and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_b",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_body_b",1)
			end
			self:AttackReset()
		end)
	elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
	and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_body_l",1)
			end
			self:AttackReset()
		end)
	elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
	and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
	and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
			end
			else
			if not self.Boss and math.random(3)==2 then
			self.BodyPain = true
			end
			self:PlaySequenceAndMove("down_body_r",1)
			end
			self:AttackReset()
		end)
		end
	elseif not self.Downed and not self.StandingUp and not self.Downing and dmg:IsDamageType(DMG_BURN) and not self.DownSafety then
		self.DownSafety = true
		self:Ignite(5)
		self:AttackReset()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local man = dmg:GetAttacker()
		local dmer = dmg:GetInflictor()
		self:CICO(function(self)
			self.DownSafety = false
			if dmer.NoDown or self.CantDowned then
			self:Extinguish()
			self.Downed = false
			self.Downing = false
			if self:GetCooldown("Flinch")<=0 then
			if self.Flinches == 10 then
			self.Flinches = 0
			self:SetCooldown("Flinch",math.random(8,13))
			end
			self.Flinches = math.min(11,self.Flinches + 1)
			if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
			self:PlaySequenceAndMove("flinch_fire_f",1)
			elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
			self:PlaySequenceAndMove("flinch_fire_b",1)
			end
			end
			else
			self:PlaySequenceAndMove("down_fire",1)
			end
		end)
	elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_SHOCK) and not self.DownSafety then
		self.DownSafety = true
		self:AttackReset()
		local man = dmg:GetAttacker()
		self:CICO(function(self)
			self.DownSafety = false
			local fx = EffectData()
			fx:SetEntity(self)
			fx:SetOrigin(self:LocalToWorld(Vector(0,0,50)))
			fx:SetStart(self:LocalToWorld(Vector(0,0,50)))
			fx:SetScale(0.5)
			fx:SetMagnitude(10)
			for i=1,math.Round(78/80,1)*10 do
				self:Timer(0.1*i,function()
					if !IsValid(self) then return end
					self:EmitSound("ambient/energy/spark"..math.random(1,6)..".wav")
					util.Effect("teslahitboxes",fx)
				end)
			end
			self:PlaySequenceAndMove("down_electric",1)
		end)
	end
	if self:GetCooldown("DownFlinch")<=0 and not self.HeatAction and self.Downed and not self.Downing and not self.StandingUp and not self.Dodge and self.DFlinches != 7 then
		if self.DFlinches == 6 then
		self.DFlinches = 0
		self:SetCooldown("DownFlinch",4)
		end
		self.DFlinches = math.min(7,self.DFlinches + 1)
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local lft = self:GetPos()-self:GetRight()*1
		local rit = self:GetPos()+self:GetRight()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetInflictor()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) 
		and fwd:DistToSqr(pos) < lft:DistToSqr(pos) 
		and fwd:DistToSqr(pos) < rit:DistToSqr(pos) or dmer.Trample then
			self:CICO(function()
			if self.Downed then
			self.Flinching = true
			self:StopParticles()
			self:AttackReset()
			if self.Front then
			self:PlaySequenceAndMove("flinch_down_f_trample",1)
			elseif self.Back then
			self:PlaySequenceAndMove("flinch_down_b_trample",1)
			end
			self.Flinching=false
			end
			end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
		and bck:DistToSqr(pos) < rit:DistToSqr(pos) and not dmer.Trample then
			self:CICO(function()
			if self.Downed then
			self.Flinching = true
			self:StopParticles()
			self:AttackReset()
			if self.Front then
			self:PlaySequenceAndMove("flinch_down_f_trample",1)
			elseif self.Back then
			self:PlaySequenceAndMove("flinch_down_b_trample",1)
			end
			self.Flinching=false
			end
			end)
		elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
		and lft:DistToSqr(pos) < rit:DistToSqr(pos) and not dmer.Trample then
			self:CICO(function()
			if self.Downed then
			self.Flinching = true
			self:StopParticles()
			self:AttackReset()
			self.DFlinches = 0
			self:SetCooldown("DownFlinch",4)
			if self.Front then
			self:PlaySequenceAndMove("flinch_down_f_l",1)
			elseif self.Back then
			self:PlaySequenceAndMove("flinch_down_b_l",1)
			end
			self.Flinching=false
			end
			end)
		elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
		and rit:DistToSqr(pos) < bck:DistToSqr(pos) and not dmer.Trample then
			self:CICO(function()
			if self.Downed then
			self.Flinching = true
			self:StopParticles()
			self:AttackReset()
			self.DFlinches = 0
			self:SetCooldown("DownFlinch",4)
			if self.Front then
			self:PlaySequenceAndMove("flinch_down_f_r",1)
			elseif self.Back then
			self:PlaySequenceAndMove("flinch_down_b_r",1)
			end
			self.Flinching=false
			end
			end)
		end
	end
	end
	if self:GetCooldown("Flinch")<=0 and (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 128 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin)) and not self.Downed and not self.Downing and not self.StandingUp and self.Flinches != 11 and not self.Dodge and not (self.AttackArmor and self.CantDodge) and not self.Armor and dmg:GetDamage() > 5 then
		if self.Flinches == 10 then
		self.Flinches = 0
		self:SetCooldown("Flinch",math.random(8,13))
		end
		self.Flinches = math.min(11,self.Flinches + 1)
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetDamage()
		local dmt = dmg:GetDamageType()
		self.Flinching = true
		self:CICO(function()
		self.Stunned = false
		self:StopParticles()
		self:AttackReset()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) and dmer > 25 then
		if dmt == 4 then
		self:PlaySequenceAndMove("flinch_slash_hi_f"..math.random(2),1)
		else
		self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
		end
		elseif fwd:DistToSqr(pos) < bck:DistToSqr(pos) and dmer < 26 then
		if dmt == 4 then
		self:PlaySequenceAndMove("flinch_slash_mid_f"..math.random(3),1)
		else
		self:PlaySequenceAndMove("flinch_head_lvl1_f"..math.random(3),1)
		end
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) and dmer < 26 then
		if not self.Heat then
		self.Flinches = math.min(11,self.Flinches - 1)
		end
		if dmt == 4 then
		self:PlaySequenceAndMove("flinch_slash_mid_b",1)
		else
		self:PlaySequenceAndMove("flinch_head_lvl1_b",1)
		end
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) and dmer > 25 then
		if not self.Heat then
		self.Flinches = math.min(11,self.Flinches - 1)
		end
		if dmt == 4 then
		self:PlaySequenceAndMove("flinch_slash_hi_b"..math.random(2),1)
		else
		self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
		end
		end
		self.Flinching=false
		end)
	end
	self.Test = dmg:GetDamage()
	self.LastAttacker = dmg:GetAttacker()
end
function ENT:DropChair()
	if IsValid(self.Chair) then
	if self.Chair.Mine then
	local pos = self.Chair:GetPos()
	self.Chair:SetParent(nill)
	self.Chair:SetHealth(1)
	self.Chair:SetPos(pos)
	self.Chair.Mine = false
	self.Chair:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self.Chair:SetNotSolid(false)
	SafeRemoveEntity(self.ChairPos)
	if self.WPH then
		self.ChairUser = false
		self.WPH = false
		local moveset = math.random(1,8)
		if moveset==1 then
		self.Normal = true
		elseif moveset==2 then
		self.Box = true
		elseif moveset==3 then
		self.KBox = true
		elseif moveset==4 then
		self.Tackle = true
		elseif moveset==5 then
		self.Sir = true
		elseif moveset==6 then
		self.inf = true
		elseif moveset==7 then
		self.Iha = true
		elseif moveset==8 then
		self.Gng = true
		end
		self.ShiftRunAnimation = "run"
		self:Stance()
	end
	end
	end
end
function ENT:OnDeath(dmg)
	self:DropChair()
	self.OnIdleSounds ={}
	self.Downing = false
	self.HeatAction = false
	self.HeatPos = self:GetPos()
	self.HeatAng = self:GetAngles()
	self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self:SetCollisionBounds(Vector(-10,-10,0),Vector(10,10,10))
	if self.ThemeSongLoop then 
		self.ThemeSongLoop:FadeOut(4)
	end
	if IsValid(self.HeatM) then
	self.HeatM:Remove()
	end
	if IsValid(self.Mood) then
	self.Mood:Remove()
	end
	self:StopParticles()
	if dmg:GetAttacker().HeatAction and not self.Grabbed then
	self.HeatAction = true
	local cyc = self:GetCycle()
	self:Timer(0.02,function()
	self:SetPos(self.HeatPos)
	self:SetAngles(self.HeatAng)
	end)
	self:PlaySequenceAndMove(self:GetSequence(),1,function(self,cycle)if cycle < cyc then self:SetCycle(cyc) end end)
	self.HeatAction = false
	self:PlaySequenceAndMove("death"..math.random(5))
	elseif not (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 128 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin)) and dmg:GetDamageType() != DMG_POISON and not self.Grabbed and not self.Downed then
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
			if IsValid(dmg:GetAttacker()) then
				self:FaceInstant(dmg:GetAttacker():GetPos())
			else
				self:FaceInstant(dmg:GetReportedPosition())
			end
		self:PlaySequenceAndMove("down_heavy_f",1)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
			if IsValid(dmg:GetAttacker()) then
				self:FaceInstant(dmg:GetAttacker():GetPos())
				self:SetAngles(self:GetAngles()+Angle(0,180,0))
			else
				self:FaceInstant(dmg:GetReportedPosition())
				self:SetAngles(self:GetAngles()+Angle(0,180,0))
			end
		self:PlaySequenceAndMove("down_heavy_b",1)
		end
	elseif self.Downed and not self.HeatAction then
		if #self.DeadSounds > 0 then
			self:EmitSound(self.DeadSounds[math.random(#self.DeadSounds)])
		end
		if self.Front then
		self:PlaySequenceAndMove("down_f_death"..math.random(4))
		elseif self.Back then
		self:PlaySequenceAndMove("down_b_death"..math.random(4))
		else
		self:PlaySequenceAndMove("down_f_death"..math.random(4))
		end
	elseif not self.Downed and not self.HeatAction and dmg:GetDamageType() == DMG_POISON then
		if #self.DeadSounds > 0 then
			self:EmitSound(self.DeadSounds[math.random(#self.DeadSounds)])
		end
		self:PlaySequenceAndMove("death_poison"..math.random(2))
	else
	if #self.DeadSounds > 0 then
		self:EmitSound(self.DeadSounds[math.random(#self.DeadSounds)])
	end
	self:PlaySequenceAndMove("death"..math.random(5))
	end
	SafeRemoveEntityDelayed(self,60)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self:PauseCoroutine(false)
end
function ENT:OnSpawn()
	end
function ENT:OnCombineBall(ball)
	local dmg = DamageInfo()
	dmg:SetAttacker(IsValid(ball:GetOwner()) and ball:GetOwner() or ball)
	dmg:SetInflictor(ball)
	dmg:SetDamageType(DMG_BLAST)
	dmg:SetDamage(1)
	
	self:TakeDamageInfo(dmg)
	ball:Fire("explode", 0)
	
	return true
end
function ENT:ResetFace()
	self.Calm = false
	self.Angry = false
	self.Angry2 = false
	self.Angry3 = false
	self.Pain = false
	self.Pain2 = false
	self.Pain3 = false
	self.Fear = false
	self.Shocked = false
end
function ENT:CustomThink()
	if IsValid(self:GetEnemy()) then
		local enemy = self:GetEnemy()
		if enemy:IsNextBot() and enemy:GetClass("drg_*") then
			if enemy:IsPossessed() then
				if enemy:PossessionGetLockedOn() == self then
					self.Aggressor = true
				else
					self.Aggressor = false
				end
			else
				self.Aggressor = false
			end
		else
			self.Aggressor = false
		end
	else
		self.Aggressor = false
	end
	if IsValid(self.StunFX) then
		if not (self:GetSequenceName(self:GetSequence()) == "piyori_head_b_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_lp" or self:GetSequenceName(self:GetSequence()) == "piyori_head_b_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_lp") then
			self.StunFX:Remove()
			self.Stunned = false
		end
	end
	if IsValid(self.Weapon) then
		if self.Yop and not (self:GetSequenceName(self:GetSequence()) == "yop_drink_st" or self:GetSequenceName(self:GetSequence()) == "yop_drink_lp" or self:GetSequenceName(self:GetSequence()) == "yop_drink_en") then
		self.Weapon:Remove()
		end
		if (self.Weapon:GetBodygroup(0) == 0) or (self.Weapon:GetBodygroup(0) == 3) or (self.Weapon:GetBodygroup(0) == 4) or (self.Weapon:GetBodygroup(0) == 10) or (self.Weapon:GetBodygroup(0) == 30) then
			self.KnifeUser = true
		elseif (self.Weapon:GetBodygroup(0) == 1) or (self.Weapon:GetBodygroup(0) == 17) then
			self.BatUser = true
		elseif (self.Weapon:GetBodygroup(0) == 2) or (self.Weapon:GetBodygroup(0) == 25) then
			self.KatanaUser = true
		elseif (self.Weapon:GetBodygroup(0) == 8) then
			self.KatanaUser = true
			self.WKatanaUser = true
		end
		else
		self.KnifeUser = false
		self.BatUser = false
		self.KatanaUser = false
		self.WKatanaUser = false
	end
	if IsValid(self.Chair) then
		if self.WPH then
			self.ChairUser = true
		elseif self.FWPC then
			self.TableUser = true
		else
			self.ChairUser = false
			self.TableUser = false
		end
	end
	if not self.HeatAction then
		if self.Combat and not self.Attacking and not (self.Flinching or self.Fearme or self.Angr or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Angry then
			self:ResetFace()
			end
			self.Angry = true
		elseif (self.CantDodge or self.Angr) and not (self.Flinching or self.Fearme or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Angry2 then
			self:ResetFace()
			end
			self.Angry2 = true
		elseif not self.Combat and not self.Attacking and not (self.Flinching or self.Fearme or self.Angr or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Calm then
			self:ResetFace()
			end
			self.Calm = true
		elseif self.Flinching or self:IsDead() or self.Downing or self.Downed or self.Stunned then
			if not self.Pain then
			self:ResetFace()
			end
			self.Pain = true
		elseif self.Fearme and not self.Attacking and not (self.Flinching or self.Angr or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Shocked then
			self:ResetFace()
			end
			self.Shocked = true
		end
	end
	if self.Calm then
	self:SetPoseParameter("face", 1)
	elseif self.Angry then
	self:SetPoseParameter("face", 2)
	elseif self.Angry2 then
	self:SetPoseParameter("face", 3)
	elseif self.Angry3 then
	self:SetPoseParameter("face", 4)
	elseif self.Pain then
	self:SetPoseParameter("face", 5)
	elseif self.Pain2 then
	self:SetPoseParameter("face", 6)
	elseif self.Pain3 then
	self:SetPoseParameter("face", 7)
	elseif self.Fear then
	self:SetPoseParameter("face", 8)
	elseif self.Shocked then
	self:SetPoseParameter("face", 9)
	elseif not self.Calm and not self.Angry and not self.Angry2 and not self.Angry3 and not self.Pain and not self.Pain2 and not self.Pain3 and not self.Fear and not self.Shocked then
	self:SetPoseParameter("face", 0)
	end
	if self.FaceGesture then
		if not self.Faceless then
			self:AddGestureSequence(self:LookupSequence("faces"),1)
		elseif self.Faceless then
			self:RemoveAllGestures()
		end
	end
	if self:Health() < self:GetMaxHealth()/self.HeatHealth and not self:IsDead() and not self:IsDown() and not self.Heat and not self.HeatAction and self.CanHeat and not self.Downed then
	self.Heat = true
	self.HeatM = ents.Create("obj_yakuza_heat")
	self.HeatM:SetModel("models/scot/yakuza0/heat.mdl")
	self.HeatM:Spawn()
	self.HeatM:SetParent(self)
	self.HeatM:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
	ParticleEffectAttach(self.HeatParticle,PATTACH_POINT_FOLLOW,self.HeatM,0)
	if self.HeatNoDown then
		self.CantDowned = true
	end
	self:EmitSound("yakuza0/gage_enemy.wav",511)
	end
	if self.WPH and IsValid(self.Chair) and IsValid(self.ChairPos) and self.Chair.Mine and (self.Downed and not self.Exception or self.Downing or self.Flinching) then
	self:DropChair()
	end
	if self.ThrowKnife and (self.Downed or self.Downing or self.Flinching) then
	self.ThrowKnife = false
	self.ThrowKnifeLower = true
	if IsValid(self.Weapon) then
		self.Weapon:Remove()
		self:SetCooldown("Ranger",10)
	end
	self.NoMove = false
	self.NoGuard = false
	self.NoDodge = false
	self:Stance()
	elseif self.ThrowBomb and (self.Downed or self.Downing or self.Flinching) then
	self.ThrowBomb = false
	self.ThrowBombLower = true
	if IsValid(self.Weapon) then
		self.Weapon:Remove()
		self:SetCooldown("Ranger",10)
	end
	self.NoMove = false
	self.NoGuard = false
	self.NoDodge = false
	self:Stance()
	end
	if self.Fearme and not IsValid(self.Mood) and not self:IsDead() then
	self.Mood = ents.Create("obj_yakuza_heat")
	self.Mood:SetModel("models/scot/yakuza/goon_mood.mdl")
	self.Mood:Spawn()
	self.Mood:SetParent(self)
	self.Mood:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
	ParticleEffectAttach("maddog0_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("maddog0_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("maddog0_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("maddog0_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	elseif self.Angr and not IsValid(self.Mood) and not self:IsDead() then
	self.Mood = ents.Create("obj_yakuza_heat")
	self.Mood:SetModel("models/scot/yakuza/goon_mood.mdl")
	self.Mood:Spawn()
	self.Mood:SetParent(self)
	self.Mood:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
	ParticleEffectAttach("dragon_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("dragon_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("dragon_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	ParticleEffectAttach("dragon_heat_glow",PATTACH_POINT_FOLLOW,self.Mood,0)
	elseif not (self.Fearme or self.Angr) and IsValid(self.Mood) then
	self.Mood:Remove()
	end
	if self.Angr and self:GetEnemy().Downed and ((self:GetEnemy():GetSequenceName(self:GetEnemy():GetSequence()) == "down_f") or (self:GetEnemy():GetSequenceName(self:GetEnemy():GetSequence()) == "down_b")) then
	self:AddEntityRelationship( self:GetEnemy(), D_HT, 1 )
	self.Angr = false
	end
	if self.Downing and not self.WBSafety and not (self:GetSequenceName(self:GetSequence()) == "down_wall_bound_f" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_b" or self:GetSequenceName(self:GetSequence()) == "down_wall_f" or self:GetSequenceName(self:GetSequence()) == "down_wall_b" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_f_g" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_b_g") then
	local pos = self:GetPos()+self:GetUp()*60
	local posf1 = self:GetPos()+self:GetForward()*-15+self:GetUp()*60
	local posf2 = self:GetPos()+self:GetForward()*-15+self:GetUp()*60+self:GetRight()*13
	local posf3 = self:GetPos()+self:GetForward()*-15+self:GetUp()*60+self:GetRight()*-13
	local posb1 = self:GetPos()+self:GetForward()*15+self:GetUp()*60
	local posb2 = self:GetPos()+self:GetForward()*15+self:GetUp()*60+self:GetRight()*13
	local posb3 = self:GetPos()+self:GetForward()*15+self:GetUp()*60+self:GetRight()*-13
	local tr1 = util.TraceLine({
		start=pos,
		endpos=posf1,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	local tr2 = util.TraceLine({
		start=pos,
		endpos=posf2,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	local tr3 = util.TraceLine({
		start=pos,
		endpos=posf3,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	local tr4 = util.TraceLine({
		start=pos,
		endpos=posb1,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	local tr5 = util.TraceLine({
		start=pos,
		endpos=posb2,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	local tr6 = util.TraceLine({
		start=pos,
		endpos=posb3,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	if tr1.HitWorld or tr2.HitWorld or tr3.HitWorld then
		self.WBSafety = true
		if tr1.HitWorld then
		self.Walle = tr1.HitNormal
		elseif tr2.HitWorld then
		self.Walle = tr2.HitNormal
		elseif tr3.HitWorld then
		self.Walle = tr3.HitNormal
		end
		self:CICO(function(self)
		if self.WBProtection then
		self:SetAngles(self.Walle:Angle())
		self:PlaySequenceAndMove("down_wall_f")
		else
		self:SetAngles(self.Walle:Angle())
		self:PlaySequenceAndMove("down_wall_bound_f")
		end
		end)
	elseif tr4.HitWorld or tr5.HitWorld or tr6.HitWorld then
		self.WBSafety = true
		if tr4.HitWorld then
		self.Walle = tr4.HitNormal
		elseif tr5.HitWorld then
		self.Walle = tr5.HitNormal
		elseif tr6.HitWorld then
		self.Walle = tr6.HitNormal
		end
		self:CICO(function(self)
		if self.WBProtection then
		self:SetAngles(self.Walle:Angle())
		self:SetAngles(self:GetAngles()+Angle(0,180,0))
		self:PlaySequenceAndMove("down_wall_b")
		else
		self:SetAngles(self.Walle:Angle())
		self:SetAngles(self:GetAngles()+Angle(0,180,0))
		self:PlaySequenceAndMove("down_wall_bound_b")
		end
		end)
	end
	end
	if GetConVarNumber("ai_disabled") != 1 and not (self:IsDead() or self:IsDown()) and not self.Gun and not self.Shotgun and not self.Bat and not self:IsRunning() and not self.DownSafety then
	local enemy = self:GetEnemy()
	if self:GetCooldown("Dodge")<=0 and enemy.Attacking and not self.Flinching and not self.CantDodge and not self.NoDodge and not self.Downing and not self.Downed and not self.Blocking then
	self:SetCooldown("Dodge",self.DodgeCoolDown)
	local rng = math.random(self.DodgeChance)
	if rng==1 then
	if self:IsInRange(enemy,self.MeleeAttackRange) then
		self.Dodge = true
		self:AttackReset()
		self:EmitSound("common/sway"..math.random(3)..".wav")
		local sway = math.random(1,3)
		if sway==1 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayLeftAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		elseif sway==2 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayRightAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		elseif sway==3 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayBackAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		end
	elseif self:IsInRange(enemy,self.RangeAttackRange) and not self:IsInRange(enemy,self.MeleeAttackRange) then
		self.Dodge = true
		self:AttackReset()
		self:EmitSound("common/sway"..math.random(3)..".wav")
		local sway = math.random(1,4)
		if sway==1 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayLeftAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		elseif sway==2 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayRightAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		elseif sway==3 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayBackAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		elseif sway==4 then
		self:CICO(function(self)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		if self.Yop then
		self.Dodge = false
		end
		self:PlaySequenceAndMove(self.SwayForwardAnimation,1,self.FaceEnemy)
		self.Dodge = false
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		end)
		end
	end
	else
	self.Dodge = false
	end
	end
	end
	if self:GetCooldown("StayD")<=0 and self.Stay then
	self.Stay = false
	end
	if self.Combat then
	if self.Stay then
	self:SetCooldown("GoonAttack",0)
	self.UseWalkframes = false
	self.WalkSpeed = 0 
	self.RunSpeed = 0 
	elseif self.IdleStarter then
	self:SetCooldown("GoonAttack",9999)
	self.UseWalkframes = false
	self.WalkSpeed = 0 
	self.RunSpeed = 0
	self:SetMaxYawRate(0)
	elseif self.NoMove then
	self.UseWalkframes = false
	self.WalkSpeed = 0 
	self.RunSpeed = 0 
	else
	if self:GetMaxYawRate() == 0 then
		self:SetCooldown("GoonAttack",0)
		self:SetMaxYawRate(250)
	end
	self.UseWalkframes = true
	end
	if self:GetCooldown("Block")<=0 and self.Blocking and not self:IsPossessed() then
	self:CICO(function()
	if not self.Downed then
	self:PlaySequenceAndMove(self.GuardEndAnimation,1)
	end
	end)
	self.Blocking = false
	end
	if self.Blocking then
	self:SetCooldown("GoonAttack",0)
	self.UseWalkframes = false
	self.IdleAnimation = self.GuardLoopAnimation
	self.WalkSpeed = 0 
	self.RunSpeed = 0 
	else
	self.IdleAnimation = self.ShiftIdleAnimation
	if not self.Stay and not self.IdleStarter and not self.NoMove then
	self.UseWalkframes = true
	end
	end
	end
	if self:IsPossessed() and not (self:IsDown() or self:IsDead() or self.Stunned or self.Downed or self.Tire) then
		self:DirectPoseParametersAt(self:PossessorTrace().HitPos, "aim_pitch", "aim_yaw", self:EyePos())
	elseif self:HasEnemy() and self:IsInSight(self:GetEnemy()) and not (self:IsDown() or self.Stunned or self:IsDead() or self.Downed or self.Tire) then
		if self:GetEnemy():LookupBone("face_c_n") then
		self:DirectPoseParametersAt(self:GetEnemy():GetBonePosition(self:GetEnemy():LookupBone("face_c_n")), "aim_pitch", "aim_yaw", self:EyePos())
		else
		self:DirectPoseParametersAt(self:GetEnemy():GetPos(), "aim_pitch", "aim_yaw", self:EyePos())
		end
	else self:DirectPoseParametersAt(nil, "aim_pitch", "aim_yaw", self:EyePos()) end
end
function ENT:CICO(callback)
	local oldThread = self.BehaveThread
	self.BehaveThread = coroutine.create(function()
		callback(self)
		self.BehaveThread = oldThread
	end)
end
function ENT:OnUpdateAnimation()
	if self:IsDead() then return end
	if not self:IsOnGround() then return self.JumpAnimation, self.JumpAnimRate
	elseif self:IsRunning() then return self.RunAnimation, self.RunAnimRate
	elseif self:IsMoving() then return self.WalkAnimation, self.WalkAnimRate
	else return self.IdleAnimation, self.IdleAnimRate 
	end
end
end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)