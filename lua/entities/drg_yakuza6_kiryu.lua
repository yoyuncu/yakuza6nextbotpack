if not DrGBase then return end
ENT.Base = "drgbase_nextbot"

-- Editables --
ENT.PrintName = "Kazuma Kiryu"
ENT.Category = "Yakuza 6"
ENT.Models = {"models/yakuza6/kazumakiryukamuro.mdl"}
ENT.CollisionBounds = Vector(13, 13, 74)
ENT.SpawnHealth = 1000
ENT.ShoveResistance = true
ENT.MeleeAttackRange = 80
ENT.RangeAttackRange = 250
ENT.ReachEnemyRange = 100
ENT.StrafeMin = 50
ENT.StrafeMax = 175
ENT.Factions = {FACTION_REBELS}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.RagdollOnDeath = false
ENT.Omniscient = false
ENT.SpotDuration = 60
ENT.ReachEnemyRange = 80
ENT.SightFOV = 360
ENT.UseWalkframes = true 
ENT.MaxYawRate = 600

ENT.ClimbLedges = false
ENT.ClimbProps = false
ENT.ClimbLadders = false

-- Possession --
ENT.EyeBone = "face_c_n"
ENT.EyeOffset = Vector(0, 0, 5)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.PossessionCrosshair = true
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_CUSTOM
ENT.PossessionViews = {{offset = Vector(0, 0, 30),distance = 100,eyepos=false},{offset = Vector(7.5, 0, 0),distance = 0,eyepos = true}}
ENT.PossessionBinds = {
	[IN_ATTACK] = {{coroutine = false,onkeydown = function(self)
	if self.Downing then
  	self:CallInCoroutine(function()
	self.Downing = false
	end)
	end
	if self.Downed then
  	self:CallInCoroutine(function()
	self.Downed = false
	end)
	end
	if self.StandingUp then
  	self:CallInCoroutine(function()
	self.StandingUp = false
	end)
	end
	if self:IsDead() or (self:GetSequenceName(self:GetSequence()) == "down_*") or self.DownSafety or self.DownSafety2 or self.Stunned or self.Taunting or self.Downing or self.StandingUp or self.Downed or self.Flinching or self.Dodge or self.Gowan and not (self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_f" or self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_b") or self.Blocking then return end
	if self.Cmb01 and self.Safety then
	self.Safety = false
	self.Cmb01 = false
	self:CICO(function()
	self.NoDown = false
	self.Fin1 = false
	self.Fin2 = false
	self.Fin3 = false
	self.Fin4 = false
	self.Fin5 = false
	self.Fin6 = false
	self.Fin7 = false
	self.Fin8 = false
	self.Kick = false
	self.Attacking = true
	if self.Combat then
	if self.Beast and not (self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_f" or self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_b") then
	self:EmitSound("kiryu/attack_l1.wav",85)
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_cmb01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_f" or self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_b") then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Gowan = false
	self.HeatC = math.min(300,self.HeatC - 50)
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("beast_atk_guard_heavy",1)
	elseif self.Rush then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rush_cmb01",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Dragon then
	self:EmitSound("kiryu/attack_s3.wav",85)
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dragon_cmb01",self.DragonSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	end
	self.Cmb01 = true
	self.Cmb02 = false
	self.Safety = true
	self.Attacking = false
	end)
	end
	if self.Cmb02 then
	self.Cmb02 = false
	self:CICO(function()
	self.Attacking = true
	if self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_cmb01") then
	self:EmitSound("kiryu/attack_l2.wav",85)
	self.Damage = 35
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_cmb02",1)
	elseif self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb01") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rush_cmb02",self.RushSpeed)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb01") then
	self:EmitSound("kiryu/attack_s2.wav",85)
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dragon_cmb02",self.DragonSpeed)
	end
	self.Cmb01 = true
	self.Cmb03 = false
	self.Attacking = false
	end)
	end
	if self.Cmb03 then
	self.Cmb03 = false
	self:CICO(function()
	self.Attacking = true
	if self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_cmb02") then
	self:EmitSound("kiryu/attack_l3.wav",85)
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_cmb03",1)
	elseif self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb02") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rush_cmb03",self.RushSpeed)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb02") then
	self:EmitSound("kiryu/attack_s4.wav",85)
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dragon_cmb03",self.DragonSpeed)
	end
	self.Cmb01 = true
	self.Cmb04 = false
	self.Attacking = false
	end)
	end
	if self.Cmb04 then
	self.Cmb04 = false
	self:CICO(function()
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb03") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rush_cmb04",self.RushSpeed)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb03") then
	self:EmitSound("kiryu/attack_l1.wav",85)
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("dragon_cmb04",self.DragonSpeed)
	end
	self.Cmb01 = true
	self.Cmb05 = false
	self.Attacking = false
	end)
	end
	if self.Cmb05 then
	self.Cmb05 = false
	self:CICO(function()
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb04") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 10
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("rush_cmb05",self.RushSpeed)
	end
	self.Cmb01 = true
	self.Cmb06 = false
	self.Attacking = false
	end)
	end
	if self.Cmb06 then
	self.Cmb06 = false
	self:CICO(function()
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb05") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self.Kick = true
	self:PlaySequenceAndMove("rush_cmb06",self.RushSpeed)
	self.Kick = false
	end
	self.Cmb01 = true
	self.Cmb07 = false
	self.Attacking = false
	end)
	end
	if self.Cmb07 then
	self.Cmb07 = false
	self:CICO(function()
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb06") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Kick = true
	self:PlaySequenceAndMove("rush_cmb07",self.RushSpeed)
	self.Kick = false
	end
	self.Cmb01 = true
	self.Cmb08 = false
	self.Attacking = false
	end)
	end
	if self.Cmb08 then
	self.Cmb08 = false
	self:CICO(function()
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb07") then
	self:EmitSound("kiryu/attack_s"..math.random(3)..".wav",85)
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self.Kick = true
	self:PlaySequenceAndMove("rush_cmb08",self.RushSpeed)
	self.Kick = false
	end
	self.Cmb01 = true
	self.Cmb09 = false
	self.Attacking = false
	end)
	end
	end}},
	[IN_ATTACK2] = {{coroutine = false,onkeydown = function(self)
		if not self.Combat then
			if not self.Changed then
			self.Changed = true
			self.Emote = self.Emote +1
			if self.Emote > 22 then
				self.Emote = 1
			end
			if self.Emote==1 then
			self:GetPossessor():ChatPrint("Emote: Thumbs Up.")
			elseif self.Emote==2 then
			self:GetPossessor():ChatPrint("Emote: Yes.")
			elseif self.Emote==3 then
			self:GetPossessor():ChatPrint("Emote: No.")
			elseif self.Emote==4 then
			self:GetPossessor():ChatPrint("Emote: Angry.")
			elseif self.Emote==5 then
			self:GetPossessor():ChatPrint("Emote: Embarrassed.")
			elseif self.Emote==6 then
			self:GetPossessor():ChatPrint("Emote: Sad.")
			elseif self.Emote==7 then
			self:GetPossessor():ChatPrint("Emote: Laugh.")
			elseif self.Emote==8 then
			self:GetPossessor():ChatPrint("Emote: Question.")
			elseif self.Emote==9 then
			self:GetPossessor():ChatPrint("Emote: Point Forward.")
			elseif self.Emote==10 then
			self:GetPossessor():ChatPrint("Emote: Point Left.")
			elseif self.Emote==11 then
			self:GetPossessor():ChatPrint("Emote: Point Right.")
			elseif self.Emote==12 then
			self:GetPossessor():ChatPrint("Emote: Understand.")
			elseif self.Emote==13 then
			self:GetPossessor():ChatPrint("Emote: Suprise.")
			elseif self.Emote==14 then
			self:GetPossessor():ChatPrint("Emote: Think.")
			elseif self.Emote==15 then
			self:GetPossessor():ChatPrint("Emote: Sorry.")
			elseif self.Emote==16 then
			self:GetPossessor():ChatPrint("Emote: Shoo.")
			elseif self.Emote==17 then
			self:GetPossessor():ChatPrint("Emote: Call Over.")
			elseif self.Emote==18 then
			self:GetPossessor():ChatPrint("Emote: Dissapointed.")
			elseif self.Emote==19 then
			self:GetPossessor():ChatPrint("Emote: Bow.")
			elseif self.Emote==20 then
			self:GetPossessor():ChatPrint("Emote: Request.")
			elseif self.Emote==21 then
			self:GetPossessor():ChatPrint("Emote: Proud.")
			elseif self.Emote==22 then
			self:GetPossessor():ChatPrint("Emote: Happy.")
			end
			else return end
		end
	if not self.Combat then return end
	if self.Air and not self.DownSafety and self.Dragon and not self:IsDead() then
	self.DownSafety = true
	self:SetCooldown("KiryuDodgeAnim",1)
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Attacking = true
		self.Fin2 = true
		self.Damage = 50
		self.SetupType = DMG_PREVENT_PHYSICS_FORCE
		self:PlaySequenceAndMove("dragon_atk_antidown_f",1,function(self,cycle)if cycle < 0.55 then self:PossessionFaceForward() end end)
		self.Attacking = false
		self.Fin2 = false
	end)
	end
	if self.Downing then
  	self:CallInCoroutine(function()
	self.Downing = false
	end)
	end
	if self.Downed then
  	self:CallInCoroutine(function()
	self.Downed = false
	end)
	end
	if self.StandingUp then
  	self:CallInCoroutine(function()
	self.StandingUp = false
	end)
	end
	if (self:GetSequenceName(self:GetSequence()) == "down_f" or self:GetSequenceName(self:GetSequence()) == "down_standup_f" or self:GetSequenceName(self:GetSequence()) == "down_standup_r" or self:GetSequenceName(self:GetSequence()) == "down_standup_l" or self:GetSequenceName(self:GetSequence()) == "down_fatal_b_lp") and (self.Dragon or self.Rush) and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
	self.Cmb01 = false
  	self:CICO(function()
	self.NoDown = false
	self.Fin1 = false
	self.Fin2 = false
	self.Fin3 = false
	self.Fin4 = false
	self.Fin5 = false
	self.Fin6 = false
	self.Fin7 = false
	self.Fin8 = false
	self.Kick = false
	self.Attacking = true
	self.DownSafety = false
		if self.Dragon then
		self.Damage = 25
		self.Downed = false
		self.SetupType = DMG_DIRECT
		self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
		self:PlaySequenceAndMove("dragon_atk_standup_f",1)
		self.StandingUp = false
		elseif self.Rush then
		self.Damage = 15
		self.Downed = false
		self.SetupType = DMG_GENERIC
		self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
		self:PlaySequenceAndMove("rush_atk_standup_f",1)
		self.StandingUp = false
		end
	self.Cmb01 = true
	self.Attacking = false
	end)
	elseif (self:GetSequenceName(self:GetSequence()) == "down_b" or self:GetSequenceName(self:GetSequence()) == "down_standup_b" or self:GetSequenceName(self:GetSequence()) == "down_fatal_f_lp") and (self.Dragon or self.Rush) and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
	self.Cmb01 = false
  	self:CICO(function()
	self.NoDown = false
	self.Fin1 = false
	self.Fin2 = false
	self.Fin3 = false
	self.Fin4 = false
	self.Fin5 = false
	self.Fin6 = false
	self.Fin7 = false
	self.Fin8 = false
	self.Kick = false
	self.Attacking = true
	self.DownSafety = false
		if self.Dragon then
		self.Damage = 25
		self.Downed = false
		self.SetupType = DMG_DIRECT
		self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
		self:PlaySequenceAndMove("dragon_atk_standup_b",1)
		self.StandingUp = false
		elseif self.Rush then
		self.Damage = 15
		self.Downed = false
		self.SetupType = DMG_GENERIC
		self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
		self:PlaySequenceAndMove("rush_atk_standup_b",1)
		self.StandingUp = false
		end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if not self:IsDead() and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if self.HeatC > 100 then
	if IsValid(self.NTarget1) and IsValid(self.Nishiki) then
	local pos1 = self.Nishiki:GetPos()
	local pos2 = self.NTarget1:GetPos()
	if self:GetPos():Distance(pos1) < 200 and self:GetPos():Distance(pos2) < 200 then
	if (self.NTarget1.Category == "Yakuza Kiwami" or self.NTarget1.Category == "Yakuza 0" or self.NTarget1.Category == "Yakuza Kiwami 5" or self.NTarget1.Category == "Yakuza Kiwami 3" or self.NTarget1.Category == "Yakuza Fiercest Warrior" or self.NTarget1.Category == "Yakuza Ishin!") and (self.Nishiki.Category == "Yakuza 0") then
	self.NTarget1.Downed = true
	self.Nishiki.Downed = true
	self.Downed = true
	self.HeatAction = true
	self.NTarget1.HeatAction = true
	self.NTarget1.Attacking = false
	self.NTarget1.Blocking = false
	self.NTarget1.Dodging = false
	self.Nishiki.HeatAction = true
	self.Nishiki.Attacking = false
	self.Nishiki.Blocking = false
	self.Nishiki.Dodging = false
	local man1 = self.NTarget1
	local man2 = self.Nishiki
	self.Target = self.NTarget1
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self:Dispossess()
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(2)
		if rng==1 then
		self.Cam1 = true
		self.Cam2 = false
		self.Cam3 = false
		self.Player:SetFOV(29.4,0.5,self)
		self.Camera:ResetSequence("heat_nishiki_cam1")
		elseif rng==2 then
		self.Cam1 = false
		self.Cam2 = true
		self.Cam3 = false
		self.Player:SetFOV(23.1,0.5,self)
		self.Camera:ResetSequence("heat_nishiki_cam2")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_nishiki_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDuoDamage")<=0 then
			self:SetCooldown("KiryuDuoDamage",30)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		man1:CICO(function(man1)
		man1:SetAngles(self:GetAngles())
		man1:SetPos(self:GetPos())
		man1:StopParticles()
		man1.Tire = false
		if man1:IsPossessed() then
		local ply2 = man1:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man1:Dispossess()
		man1:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(8,function()
		if IsValid(self.Camera) then
		man1:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man1:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man1:PlaySequenceAndMoveAbsolute("heat_nishiki_sync1")
		self.NTarget1 = nill
		man1.NTargeet1 = false
		end)
		man2:CICO(function(man2)
		man2:SetAngles(self:GetAngles())
		man2:SetPos(self:GetPos())
		man2:StopParticles()
		man2.Tire = false
		local ncol = man2:GetCollisionGroup()
		man2:SetCollisionGroup(10)
		man2:PlaySequenceAndMoveAbsolute("heat_nishiki_sync2")
		man2:Timer(2.5,function()
		man2:SetCollisionGroup(ncol)
		end)
		self.Nishiki = nill
		man2.Nishikie = false
		man2.Downed = false
		man2.HeatAction = false
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.OverranS and (self:GetSequenceName(self:GetSequence()) == "beast_cmb03_fin" and self:GetCycle() > 0.2) then
		local lockedOn = self:PossessionGetLockedOn()
		if self.Beast and self.HeatC > 200 then
	if IsValid(self.BETarget1) and IsValid(self.BETarget2) and IsValid(self.BETarget3) and IsValid(self.BETarget4) then
	local pos1 = self.BETarget1:GetPos()
	local pos2 = self.BETarget2:GetPos()
	local pos3 = self.BETarget3:GetPos()
	local pos4 = self.BETarget4:GetPos()
	if self:GetPos():Distance(pos1) < 330 and self:GetPos():Distance(pos2) < 330 and self:GetPos():Distance(pos3) < 330 and self:GetPos():Distance(pos4) < 330 then
	if (self.BETarget1.Category == "Yakuza Kiwami" or self.BETarget1.Category == "Yakuza 0" or self.BETarget1.Category == "Yakuza Kiwami 5" or self.BETarget1.Category == "Yakuza Kiwami 3" or self.BETarget1.Category == "Yakuza Fiercest Warrior" or self.BETarget1.Category == "Yakuza Ishin!") and (self.BETarget2.Category == "Yakuza Kiwami" or self.BETarget2.Category == "Yakuza 0" or self.BETarget2.Category == "Yakuza Kiwami 5" or self.BETarget2.Category == "Yakuza Kiwami 3" or self.BETarget2.Category == "Yakuza Fiercest Warrior" or self.BETarget2.Category == "Yakuza Ishin!") and (self.BETarget3.Category == "Yakuza Kiwami" or self.BETarget3.Category == "Yakuza 0" or self.BETarget3.Category == "Yakuza Kiwami 5" or self.BETarget3.Category == "Yakuza Kiwami 3" or self.BETarget3.Category == "Yakuza Fiercest Warrior" or self.BETarget3.Category == "Yakuza Ishin!") and (self.BETarget4.Category == "Yakuza Kiwami" or self.BETarget4.Category == "Yakuza 0" or self.BETarget4.Category == "Yakuza Kiwami 5" or self.BETarget4.Category == "Yakuza Kiwami 3" or self.BETarget4.Category == "Yakuza Fiercest Warrior" or self.BETarget4.Category == "Yakuza Ishin!") then
	self.BETarget1.Downed = true
	self.BETarget2.Downed = true
	self.BETarget3.Downed = true
	self.BETarget4.Downed = true
	self.Downed = true
	self.OverranS = true
	self.HeatAction = true
	self.BETarget1.HeatAction = true
	self.BETarget1.Attacking = false
	self.BETarget1.Blocking = false
	self.BETarget1.Dodging = false
	self.BETarget2.HeatAction = true
	self.BETarget2.Attacking = false
	self.BETarget2.Blocking = false
	self.BETarget2.Dodging = false
	self.BETarget3.HeatAction = true
	self.BETarget3.Attacking = false
	self.BETarget3.Blocking = false
	self.BETarget3.Dodging = false
	self.BETarget4.HeatAction = true
	self.BETarget4.Attacking = false
	self.BETarget4.Blocking = false
	self.BETarget4.Dodging = false
	local man1 = self.BETarget1
	local man2 = self.BETarget2
	local man3 = self.BETarget3
	local man4 = self.BETarget4
	self.DTarget1 = self.BETarget1
	self.DTarget2 = self.BETarget2
	self.DTarget3 = self.BETarget3
	self.DTarget4 = self.BETarget4
		self:CICO(function(self)
		self.OverranS = false
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,5,self)
		self:Dispossess()
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_beast_overrun_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_beast_overrun_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_beast_overrun_cam2")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_beast_overrun_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuOverrunDamage")<=0 then
			self:SetCooldown("KiryuOverrunDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		man1:CICO(function(man1)
		man1:SetAngles(self:GetAngles())
		man1:SetPos(self:GetPos())
		man1:StopParticles()
		man1.Tire = false
		if man1:IsPossessed() then
		local ply2 = man1:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man1:Dispossess()
		man1:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(13,function()
		if IsValid(self.Camera) then
		man1:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man1:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man1:PlaySequenceAndMoveAbsolute("heat_beast_overrun_sync1")
		self.BETarget1 = nill
		man1.BETargeet1 = false
		end)
		man2:CICO(function(man2)
		man2:SetAngles(self:GetAngles())
		man2:SetPos(self:GetPos())
		man2:StopParticles()
		man2.Tire = false
		if man2:IsPossessed() then
		local ply2 = man2:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man2:Dispossess()
		man2:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(13,function()
		if IsValid(self.Camera) then
		man2:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man2:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man2:PlaySequenceAndMoveAbsolute("heat_beast_overrun_sync2")
		self.BETarget2 = nill
		man2.BETargeet2 = false
		end)
		man3:CICO(function(man3)
		man3:SetAngles(self:GetAngles())
		man3:SetPos(self:GetPos())
		man3:StopParticles()
		man3.Tire = false
		if man3:IsPossessed() then
		local ply2 = man3:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man3:Dispossess()
		man3:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(13,function()
		if IsValid(self.Camera) then
		man3:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man3:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man3:PlaySequenceAndMoveAbsolute("heat_beast_overrun_sync3")
		self.BETarget3 = nill
		man3.BETargeet3 = false
		man3.Downed = false
		end)
		man4:CICO(function(man4)
		man4:SetAngles(self:GetAngles())
		man4:SetPos(self:GetPos())
		man4:StopParticles()
		man4.Tire = false
		if man4:IsPossessed() then
		local ply2 = man4:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man4:Dispossess()
		man4:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(13,function()
		if IsValid(self.Camera) then
		man4:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man4:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man4:PlaySequenceAndMoveAbsolute("heat_beast_overrun_sync4")
		self.BETarget4 = nill
		man4.BETargeet4 = false
		man4.Downed = false
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Dodge and not self.Attacking and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if (self.Beast or self.Dragon) and lockedOn.Downed and not lockedOn.HeatAction and lockedOn.Front and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" or self:PossessionGetLockedOn().Category == "Yakuza 0" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" then
	lockedOn.Downed = true
	self.Downed = true
	self:SetAngles(lockedOn:GetAngles())
	self.HeatAction = true
	self.GettUp = false
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self:Dispossess()
		self.Angry2 = true
		self.Angry = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_mount_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_mount_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_mount_cam3")
		end
		else
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_brawler_downf_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_brawler_downf_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_brawler_downf_cam3")
		end
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
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		self.Player:SetFOV(60,1,self)
		self:PlaySequenceAndMoveAbsolute("heat_mount_sync")
		else
		self.Player:SetFOV(53,2.5,self)
		self:PlaySequenceAndMoveAbsolute("heat_brawler_downf_sync")
		end
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDownDamage")<=0 then
			self:SetCooldown("KiryuDownDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(3,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		lockedOn:PlaySequenceAndMoveAbsolute("heat_mount_sync1")
		else
		lockedOn:PlaySequenceAndMoveAbsolute("heat_brawler_downf_sync1")
		end
		end)
	end 
	end
	end
		elseif (self.Beast or self.Dragon) and lockedOn.Downed and not lockedOn.HeatAction and lockedOn.Back and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" or self:PossessionGetLockedOn().Category == "Yakuza 0" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" then
	lockedOn.Downed = true
	self.Downed = true
	self:SetAngles(lockedOn:GetAngles())
	self.HeatAction = true
	self.GettUp = false
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self:Dispossess()
		self.Angry2 = true
		self.Angry = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_mount_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_mount_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_mount_cam3")
		end
		else
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_brawler_downb_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_brawler_downb_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_brawler_downb_cam3")
		end
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
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		self.Player:SetFOV(60,1,self)
		self:PlaySequenceAndMoveAbsolute("heat_mount_sync")
		else
		self.Player:SetFOV(60,2,self)
		self:PlaySequenceAndMoveAbsolute("heat_brawler_downb_sync")
		end
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDownDamage")<=0 then
			self:SetCooldown("KiryuDownDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(4,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		if self:Health() < self:GetMaxHealth()/3.33 and (self.Dragon) then
		lockedOn:PlaySequenceAndMoveAbsolute("heat_mount_sync1")
		else
		lockedOn:PlaySequenceAndMoveAbsolute("heat_brawler_downb_sync1")
		end
		end)
	end 
	end
	end
		elseif (self.Rush) and lockedOn.Downed and not lockedOn.HeatAction and lockedOn.Front and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" or self:PossessionGetLockedOn().Category == "Yakuza 0" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" then
	lockedOn.Downed = true
	self.Downed = true
	self:SetAngles(lockedOn:GetAngles())
	self.HeatAction = true
	self.GettUp = false
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(30,0.5,self)
		self:Dispossess()
		self.Angry2 = true
		self.Angry = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_downf_trample_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_downf_trample_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_downf_trample_cam3")
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
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_downf_trample_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDownDamage")<=0 then
			self:SetCooldown("KiryuDownDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(2,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_downf_trample_sync1")
		end)
	end 
	end
	end
		elseif (self.Rush) and lockedOn.Downed and not lockedOn.HeatAction and lockedOn.Back and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" or self:PossessionGetLockedOn().Category == "Yakuza 0" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" then
	lockedOn.Downed = true
	self.Downed = true
	self:SetAngles(lockedOn:GetAngles())
	self.HeatAction = true
	self.GettUp = false
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(55,1.5,self)
		self:Dispossess()
		self.Angry2 = true
		self.Angry = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_downb_kickover_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_downb_kickover_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_downb_kickover_cam3")
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
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_downb_kickover_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDownDamage")<=0 then
			self:SetCooldown("KiryuDownDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(2.7,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_downb_kickover_sync1")
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Flinching and not self.Downed and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if IsValid(lockedOn) then
		if not self:PossessionGetLockedOn().Attacking and self.Rush and self.HeatC > 200 then
	local fwd = self:PossessionGetLockedOn():GetPos()+self:PossessionGetLockedOn():GetForward()*1
	local bck = self:PossessionGetLockedOn():GetPos()-self:PossessionGetLockedOn():GetForward()*1
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	lockedOn.HeatPos = self:GetPos()
	lockedOn.HeatAng = self:GetAngles()
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,2,self)
		self:Dispossess()
		self.Angry = true
		self.Angry2 = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_rush_barrage_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_rush_barrage_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_rush_barrage_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 300)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_rush_barrage_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self:SetCooldown("KiryuBarrageDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		local rng = math.random(2)
		if rng==1 then
		lockedOn.HeadPain = true
		end
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(7,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_rush_barrage_sync1")
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Flinching and not self.Downed and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
	local pos = self:GetPos()+self:GetUp()*60
	local pos1 = self:GetPos()+self:GetForward()*-80+self:GetUp()*60
	local ply = self:GetPossessor()
	local tr = util.TraceLine({
		start=pos,
		endpos=pos1,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	if tr.HitWorld then
	if tr.HitWorld then
	self.Poser = tr.HitPos
	self.Normer = tr.HitNormal
	end
		if self.Dragon and self.HeatC > 100 and lockedOn.Attacking then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 100 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed and not self:PossessionGetLockedOn().Giant then
	lockedOn.Downed = true
	self.Downed = true
	self:SetVelocity(Vector(0,0,0))
	self:SetPos(self.Poser)
	self:SetAngles(self.Normer:Angle())
	self:SetAngles(self:GetAngles()+Angle(0,180,0))
	self:SetPos(self:GetPos()+self:GetUp()*-60)
	self.HeatAction = true
	lockedOn.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,2.3,self)
		self:Dispossess()
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(1,3)
		if rng==1 then
		self.Camera:ResetSequence("heat_brawler_wall_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_brawler_wall_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_brawler_wall_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 150)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_brawler_wall_sync")
		self.Player:SetFOV(0,0.5,self)
		self.Poser = nil
		self.Normer = nil
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuBWallDamage")<=0 then
			self:SetCooldown("KiryuBWallDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		local rng = math.random(2)
		if rng==1 then
		lockedOn.LegPain = true
		end
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(6,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_brawler_wall_sync1")
		end)
	end 
	end
	end
	end
	end
	end
	if not self:IsDead() and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if self.Dragon and self.HeatC > 200 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 and not lockedOn.Attacking then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self:SetAngles(lockedOn:GetAngles())
	self.HeatAction = true
	self.GettUp = false
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,1.6,self)
		self:Dispossess()
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_dragon_88_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_dragon_88_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_dragon_88_cam3")
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
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 300)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_dragon_88_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("Kiryu88Damage")<=0 then
			self:SetCooldown("Kiryu88Damage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		local rng = math.random(2)
		if rng==1 then
		lockedOn.BodyPain = true
		end
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(7.5,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_dragon_88_sync1")
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Flinching and not self.Downed and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if (self.Beast or self.Dragon) and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 100 and (lockedOn.ChairUser or lockedOn.TableUser) then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed and not self:PossessionGetLockedOn().Giant then
	lockedOn.Downed = true
	self.Downed = true
	self.HeatAction = true
	lockedOn.Exception = true
	lockedOn.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self:Dispossess()
		self.Angry2 = true
		self.Angry = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		if lockedOn.TableUser then
			local rng = math.random(3)
			if rng==1 then
			self.Cam1 = true
			self.Cam2 = false
			self.Cam3 = false
			self.Player:SetFOV(60+5,0.3,self)
			self.Camera:ResetSequence("heat_selfdestruct_sofa_cam1")
			elseif rng==2 then
			self.Cam1 = false
			self.Cam2 = true
			self.Cam3 = false
			self.Player:SetFOV(60+5,0.3,self)
			self.Camera:ResetSequence("heat_selfdestruct_sofa_cam2")
			elseif rng==3 then
			self.Cam1 = false
			self.Cam2 = false
			self.Cam3 = true
			self.Player:SetFOV(60+5,0.3,self)
			self.Camera:ResetSequence("heat_selfdestruct_sofa_cam3")
			end
		else
			local rng = math.random(3)
			if rng==1 then
			self.Cam1 = true
			self.Cam2 = false
			self.Cam3 = false
			self.Player:SetFOV(38.6+5,0.3,self)
			self.Camera:ResetSequence("heat_selfdestruct_chair_cam1")
			elseif rng==2 then
			self.Cam1 = false
			self.Cam2 = true
			self.Cam3 = false
			self.Player:SetFOV(41.2+5,0,self)
			self.Player:SetFOV(31.7+5,0.5,self)
			self.Camera:ResetSequence("heat_selfdestruct_chair_cam2")
			elseif rng==3 then
			self.Cam1 = false
			self.Cam2 = false
			self.Cam3 = true
			self.Player:SetFOV(41.2+5,0,self)
			self.Player:SetFOV(31.7+5,0.5,self)
			self.Camera:ResetSequence("heat_selfdestruct_chair_cam3")
			end
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(500,self.HeatC - 100)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		if lockedOn.TableUser then
			self:PlaySequenceAndMoveAbsolute("heat_selfdestruct_sofa_sync")
		else
			self:PlaySequenceAndMoveAbsolute("heat_selfdestruct_chair_sync")
		end
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoDraw(false)
		ply:SetNoTarget(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuDestructDamage")<=0 then
			self:SetCooldown("KiryuDestructDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(3,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		if lockedOn.TableUser then
			lockedOn:PlaySequenceAndMoveAbsolute("heat_selfdestruct_sofa_sync1")
		else
			lockedOn:PlaySequenceAndMoveAbsolute("heat_selfdestruct_chair_sync1")
		end
		lockedOn.Exception = false
		end)
	end 
	end
	end
	end
	end
	if self.Torment and (self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_f" or self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_b") then
		if self.Beast and self.HeatC > 200 then
	if IsValid(self.Target) then
	local pos = self.Target:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self.Target.Category == "Yakuza Kiwami" and not self.Target.Downed or self.Target.Category == "Yakuza 0" and not self.Target.Downed or self.Target.Category == "Yakuza Kiwami 5" and not self.Target.Downed or self.Target.Category == "Yakuza Kiwami 3" and not self.Target.Downed or self.Target.Category == "Yakuza Fiercest Warrior" and not self.Target.Downed or self.Target.Category == "Yakuza Ishin!" and not self.Target.Downed then
	self.Target.Downed = true
	self.Downed = true
	self.HeatAction = true
	self.Target.Attacking = false
	self.Target.Blocking = false
	self.Target.Dodging = false
	self.Target.HeatAction = true
	local man = self.Target
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,2,self)
		self:Dispossess()
		self.Angry = false
		self.Angry2 = true
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_beast_torment_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_beast_torment_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_beast_torment_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_beast_torment_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuTormentDamage")<=0 then
			self:SetCooldown("KiryuTormentDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		man:CICO(function(man)
		man:SetAngles(self:GetAngles())
		man:SetPos(self:GetPos())
		man:StopParticles()
		man.Tire = false
		if man:IsPossessed() then
		local ply2 = man:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		man:Dispossess()
		man:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(6.5,function()
		if IsValid(self.Camera) then
		man:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		man:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		man:PlaySequenceAndMoveAbsolute("heat_beast_torment_sync1")
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Flinching and not self.Downed and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
		if self.Dragon and self.HeatC > 100 then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) > 125 and self:GetPos():Distance(pos) < 200 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,2,self)
		self:Dispossess()
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_dragon_slap_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_dragon_slap_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_dragon_slap_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_dragon_slap_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuSlapDamage")<=0 then
			self:SetCooldown("KiryuSlapDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(6.5,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_dragon_slap_sync1")
		end)
	end 
	end
	end
	end
		end
	if not self:IsDead() and not self.Flinching and not self.Downed and not self.Dodge and not self.Blocking and self.Cmb01 then
		local lockedOn = self:PossessionGetLockedOn()
	local pos = self:GetPos()+self:GetUp()*60
	local pos1 = self:GetPos()+self:GetForward()*-80+self:GetUp()*60
	local ply = self:GetPossessor()
	local tr = util.TraceLine({
		start=pos,
		endpos=pos1,
		filter=function( ent ) return (  not ent:IsNPC() and not ent:IsPlayer() and not ent:IsNextBot() and (ent:GetCollisionGroup() != 20 || ent:IsWorld()) ) end
	})
	if !tr.HitWorld then
		if self:PossessionGetLockedOn().Attacking and self.Rush and self.HeatC > 100 then
	local fwd = self:PossessionGetLockedOn():GetPos()+self:PossessionGetLockedOn():GetForward()*1
	local bck = self:PossessionGetLockedOn():GetPos()-self:PossessionGetLockedOn():GetForward()*1
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,1.6,self)
		self:Dispossess()
		self.Angry = true
		self.Angry2 = false
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_rush_crush_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_rush_crush_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_rush_crush_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_rush_crush_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuCrushDamage")<=0 then
			self:SetCooldown("KiryuCrushDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(4,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_rush_crush_sync1")
		end)
	end 
	end
	end
	end
	elseif tr.HitWorld then
		if self:PossessionGetLockedOn().Attacking and self.Rush and self.HeatC > 100 then
	local fwd = self:PossessionGetLockedOn():GetPos()+self:PossessionGetLockedOn():GetForward()*1
	local bck = self:PossessionGetLockedOn():GetPos()-self:PossessionGetLockedOn():GetForward()*1
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 120 then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self:SetVelocity(Vector(0,0,0))
	self:SetPos(self.Poser)
	self:SetAngles(self.Normer:Angle())
	self:SetPos(self:GetPos()+self:GetUp()*-60)
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		local ply = self:GetPossessor()
		self.Player = ply
		self.Player:SetFOV(60,1.3,self)
		self:Dispossess()
		self.Angry2 = false
		self.Angry = true
		self.Calm = false
		self.Pain = false
		self:SetPossessionEnabled(false)
		self.Camera = ents.Create("prop_dynamic")
		self.Camera:SetModel("models/scot/yakuza/heat_cam.mdl")
		self.Camera:Spawn()
		self.Camera:SetPos(self:GetPos())
		self.Camera:SetNoDraw(true)
		self.Camera:SetNotSolid(true)
		self.Camera:SetAngles(self:GetAngles())
		local rng = math.random(3)
		if rng==1 then
		self.Camera:ResetSequence("heat_rush_wall_cam1")
		elseif rng==2 then
		self.Camera:ResetSequence("heat_rush_wall_cam2")
		elseif rng==3 then
		self.Camera:ResetSequence("heat_rush_wall_cam3")
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
		self.Damage = 85
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:EmitSound("common/ding.wav",511)
		self.HeatC = math.min(300,self.HeatC - 200)
		ply:SetPos(self:GetPos())
		ply:SetActiveWeapon( NULL )
		ply:Freeze(true)
		ply:GodEnable()
		ply:SetNoTarget(true)
		self:PlaySequenceAndMoveAbsolute("heat_rush_wall_sync")
		self.Player:SetFOV(0,0.5,self)
		self:SetPossessionEnabled(true)
		ply:Freeze(false)
		ply:GodDisable()
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:SetViewEntity(ply)
		self:Possess(ply)
		self.Cam:Remove()
		self.Camera:Remove()
		if self:GetCooldown("KiryuCrushDamage")<=0 then
			self:SetCooldown("KiryuCrushDamage",20)
		end
		self.Downed = false
		self.HeatAction = false
		self:SetCollisionGroup(col)
		end)
		lockedOn:CICO(function(lockedOn)
		lockedOn:SetAngles(self:GetAngles())
		lockedOn:SetPos(self:GetPos())
		lockedOn:StopParticles()
		lockedOn.Tire = false
		if lockedOn:IsPossessed() then
		local ply2 = lockedOn:GetPossessor()
		self:Timer(0.1,function()
		ply2:SetViewEntity(self.Cam)
		end)
		ply2:SetPos(self:GetPos())
		ply2:SetActiveWeapon( NULL )
		ply2:Freeze(true)
		ply2:GodEnable()
		ply2:SetNoTarget(true)
		ply2:SetNoDraw(true)
		self.player = ply2
		self.player:SetFOV(60,1,self)
		lockedOn:Dispossess()
		lockedOn:SetPossessionEnabled(false)
		ply2:SetViewEntity(self.Cam)
		ply2:SetNoDraw(true)
		self:Timer(8,function()
		if IsValid(self.Camera) then
		lockedOn:SetPossessionEnabled(true)
		self.player:SetFOV(0,0.5,self)
		self.player:Freeze(false)
		self.player:SetNoDraw(false)
		self.player:SetViewEntity(ply2)
		ply2:SetNoDraw(false)
		lockedOn:Possess(self.player)
		ply2:Freeze(false)
		ply2:GodDisable()
		ply2:SetNoTarget(false)
		ply2:SetViewEntity(ply2)
		end
		end)
		end
		lockedOn:PlaySequenceAndMoveAbsolute("heat_rush_wall_sync1")
		end)
	end 
	end
	end
	end
	end
		end
		if not self:IsDead() and not self.Downed and not self.Taunting and not self.StyleSwitching and not self.Downing and not self.StandingUp and not self.Flinching and not self.Dodge and not self.Guarding and not self.Gowan and self:PossessionGetLockedOn().Attacking and self.Dragon and not self:IsRunning() and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 then
		self.Damage = 250
		self.Cmb01 = false
		self.NoDown = false
		self.Fin1 = false
		self.Fin2 = false
		self.Fin3 = false
		self.Fin4 = false
		self.Fin5 = false
		self.Fin6 = false
		self.Fin7 = false
		self.Fin8 = false
		self.Kick = false
		self.TigerDrop = false
		self:CICO(function()
		self.TigerDrop = true
		self.SetupType = DMG_VEHICLE
		self:PlaySequenceAndMove("dragon_atk_counter",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.TigerDrop = false
		self.Cmb01 = true
		end)
		self.TigerDrop = false
		end
	if self:IsDead() or self.DownSafety or self.DownSafety2 or self.Stunned or (self:GetSequenceName(self:GetSequence()) == "down_*") or (self.Dodge and not (self:GetSequenceName(self:GetSequence()) == "rush_sway_b" or self:GetSequenceName(self:GetSequence()) == "rush_sway_f" or self:GetSequenceName(self:GetSequence()) == "rush_sway_r" or self:GetSequenceName(self:GetSequence()) == "rush_sway_l" or self:GetSequenceName(self:GetSequence()) == "brawler_sway_b" or self:GetSequenceName(self:GetSequence()) == "brawler_sway_f" or self:GetSequenceName(self:GetSequence()) == "brawler_sway_l" or self:GetSequenceName(self:GetSequence()) == "brawler_sway_r" or (self:GetSequenceName(self:GetSequence()) == "beast_sway_b" or self:GetSequenceName(self:GetSequence()) == "beast_sway_f" or self:GetSequenceName(self:GetSequence()) == "beast_sway_l" or self:GetSequenceName(self:GetSequence()) == "beast_sway_r") and self.HeatC > 100 and self.HeatC < 200 or self:GetSequenceName(self:GetSequence()) == "dragon_sway_b" or self:GetSequenceName(self:GetSequence()) == "dragon_sway_f" or self:GetSequenceName(self:GetSequence()) == "dragon_sway_l" or self:GetSequenceName(self:GetSequence()) == "dragon_sway_r")) or self.Taunting or self.Downed or self.Downing or self.StandingUp or self.Flinching or self.Dodge and self:GetCycle() > 0.25 or self.CanTiger or self.Torment and self.HeatC > 100 or self.Blocking and not (self:GetSequenceName(self:GetSequence()) == "dragon_guard_hit" and self.HeatC > 100) and not (self:GetSequenceName(self:GetSequence()) == "brawler_guard_hit" and self.HeatC > 100) and not (self:GetSequenceName(self:GetSequence()) == "rush_guard_hit") then return end
	if not self:IsRunning() and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 then
	self.Cmb01 = false
	local lockedOn = self:PossessionGetLockedOn()
	self:CICO(function()
	self.NoDown = false
	self.Fin1 = false
	self.Fin2 = false
	self.Fin3 = false
	self.Fin4 = false
	self.Fin5 = false
	self.Fin6 = false
	self.Fin7 = false
	self.Fin8 = false
	self.Kick = false
	self.Attacking = true
	if self.Dragon then
	if (self:GetSequenceName(self:GetSequence()) == "dragon_sway_b") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.NoDown = true
	self.Stun = true
	self.SetupType = DMG_FALL
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("dragon_atk_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Stun = false
	self.NoDown = false
	elseif (self:GetSequenceName(self:GetSequence()) == "dragon_sway_f") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("dragon_atk_sway_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "dragon_sway_l") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("dragon_atk_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "dragon_sway_r") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("dragon_atk_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "dragon_guard_hit") then
	self.Damage = 10
	self.Fin4 = true
	self.Dodge = true
	self.Guarding = false
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("dragon_guard_reverse",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Dodge = false
	self.Fin4 = false
	elseif (self:GetSequenceName(self:GetSequence()) == "flinch_body_lvl2_f") or (self:GetSequenceName(self:GetSequence()) == "flinch_body_lvl2_b") or (self:GetSequenceName(self:GetSequence()) == "flinch_head_lvl2_b") or (self:GetSequenceName(self:GetSequence()) == "flinch_head_lvl2_f") or (self:GetSequenceName(self:GetSequence()) == "flinch_leg_lvl2_b") or (self:GetSequenceName(self:GetSequence()) == "flinch_leg_lvl2_f") then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Flinching = true
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("brawler_atk_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Flinching = false
	elseif lockedOn.Downed then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("dragon_atk_down",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Trample = false
	else
	self.Damage = 35
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_l3.wav",85)
	self:PlaySequenceAndMove("dragon_atk_heavy",1)
	end
	self.Attacking = false
	self.Cmb01 = true
	elseif self.Rush and not (self:GetSequenceName(self:GetSequence()) == "rush_weave_b" or self:GetSequenceName(self:GetSequence()) == "rush_weave_f" or self:GetSequenceName(self:GetSequence()) == "rush_weave_r" or self:GetSequenceName(self:GetSequence()) == "rush_weave_l") then
	if (self:GetSequenceName(self:GetSequence()) == "rush_sway_b") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_FALL
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("rush_atk_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "rush_sway_f") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.NoDown = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("rush_atk_sway_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.NoDown = false
	elseif (self:GetSequenceName(self:GetSequence()) == "rush_sway_l") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("rush_atk_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "rush_sway_r") and self:GetCycle() < 0.25 then
	self.Damage = 30
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("rush_atk_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif lockedOn.Downed then
	self.Damage = 20
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self:PlaySequenceAndMove("rush_atk_down",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif (self:GetSequenceName(self:GetSequence()) == "rush_guard_hit") then
	self.Damage = 70
	self.Dodge = true
	self.Blocking = false
	self.HeatC = math.min(300,self.HeatC - 50)
	self:PlaySequenceAndMove("rush_guard_float",1)
	self.Dodge = false
	self.Fin2 = false
	elseif self:GetPossessor():KeyDown(IN_BACK) then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self:EmitSound("kiryu/attack_l3.wav",85)
	self:PlaySequenceAndMove("rush_atk_punch_b",1)
	else
	self.Damage = 25
	self.NoDown = true
	self.SetupType = DMG_ALWAYSGIB
	self:EmitSound("kiryu/attack_l1.wav",85)
	self:PlaySequenceAndMove("rush_atk_heavy",1)
	self.NoDown = false
	end
	self.Attacking = false
	self.Cmb01 = true
	elseif self.Beast then
	if (self:GetSequenceName(self:GetSequence()) == "beast_sway_b") and self.HeatC > 100 and self:GetCycle() < 0.25 then
	self.Damage = 25
	self.Sp = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_atk_kaihi_nage_b_miss",1)
	self.Sp = false
	elseif (self:GetSequenceName(self:GetSequence()) == "beast_sway_f") and self.HeatC > 100 and self:GetCycle() < 0.25 then
	self.Damage = 25
	self.Sp = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_atk_kaihi_nage_f_miss",1)
	self.Sp = false
	elseif (self:GetSequenceName(self:GetSequence()) == "beast_sway_l") and self.HeatC > 100 and self:GetCycle() < 0.25 then
	self.Damage = 25
	self.Sp = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_atk_kaihi_nage_l_miss",1)
	self.Sp = false
	elseif (self:GetSequenceName(self:GetSequence()) == "beast_sway_r") and self.HeatC > 100 and self:GetCycle() < 0.25 then
	self.Damage = 25
	self.Sp = true
	self.SetupType = DMG_GENERIC
	self:PlaySequenceAndMove("beast_atk_kaihi_nage_r_miss",1)
	self.Sp = false
	elseif (self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_f" or self:GetSequenceName(self:GetSequence()) == "beast_guard_hit_b") then
	self.Damage = 100
	self.SetupType = DMG_NEVERGIB
	self.Fin2 = true
	self.Gowan = false
	self.HeatC = math.min(300,self.HeatC - 100)
	self:EmitSound("kiryu/attack_xl"..math.random(2)..".wav",85)
	self:PlaySequenceAndMove("beast_atk_guard_tame",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Fin2 = false
	elseif (self:GetSequenceName(self:GetSequence()) == "beast_guard_lp") or (self:GetSequenceName(self:GetSequence()) == "beast_guard_st") then
	self.Damage = 25
	self.SetupType = DMG_GENERIC
	self.CanLoop = false
	self.Gowan = false
	self.Loops = 0
	self.Dodge = true
	self.Bear = true
	self.NoDown = true
	self:PlaySequenceAndMove("beast_guard_run_st",1,self.PossessionFaceForward)
	self.CanLoop = true
	while self:GetPossessor():KeyDown(IN_ATTACK2) and self.CanLoop and self.Loops < 2 do
		self.CanLoop = false
		self.Charging = true
		self:PlaySequenceAndMove("beast_guard_run_lp",1,self.PossessionFaceForward)
		self.CanLoop = true
		for k,v in pairs(ents.GetAll()) do
			if v.KCharged then
				v.KCharged = false
			end
		end
		self.Charging = false
	end
	if self.Bear then
	self.Bear = false
	self.Charging = false
	self.NoDown = false
	self:PlaySequenceAndMove("beast_guard_run_en",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Dodge = false
	elseif lockedOn.Downed then
	self.Damage = 40
	self.SetupType = DMG_GENERIC
	self.Trample = true
	self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	self:PlaySequenceAndMove("beast_atk_down",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Trample = false
	else
	self.CantLoop = false
	self:EmitSound("yakuza0/tame.wav",85)
	self:PlaySequenceAndMove("beast_atk_tame_tackle_st",1)
	while self:GetPossessor():KeyDown(IN_ATTACK2) and not self.CantLoop and (self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_st" or self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_lp") do
		self:PlaySequenceAndMove("beast_atk_tame_tackle_lp",1)
	end
	end
	self.Attacking = false
	self.Cmb01 = true
	end
	self.Attacking = false
	end)
	end
	if self:IsRunning() and self:IsMoving() and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 then
	self.Cmb01 = false
	self:CICO(function()
	self.Attacking = true
	if self.Dragon then
	self.Damage = 50
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("dragon_atk_run",1)
	self.Attacking = false
	self.Cmb01 = true
	elseif self.Rush then
	self.Damage = 40
	self.SetupType = DMG_ALWAYSGIB
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self:PlaySequenceAndMove("rush_atk_run_heavy",1)
	self.Attacking = false
	self.Cmb01 = true
	elseif self.Beast then
	self:EmitSound("yakuza0/tame.wav",85)
	self:PlaySequenceAndMove("beast_atk_tame_tackle_st",1)
	while self:GetPossessor():KeyDown(IN_ATTACK2) and not self.CantLoop and (self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_st" or self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_lp") do
		self:PlaySequenceAndMove("beast_atk_tame_tackle_lp",1)
	end
	self.Attacking = false
	self.Cmb01 = true
	end
	self.Attacking = false
	end)
	end
	if self.Cmb02 then
	self.Cmb02 = false
	self:CICO(function()
	self.Fin1 = true
	self.Attacking = true
	if self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_cmb01") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 55
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("beast_cmb01_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb01") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("rush_cmb01_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb01") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 45
	self.Bound = true
	self.SetupType = DMG_PREVENT_PHYSICS_FORCE
	self:PlaySequenceAndMove("dragon_cmb01_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Bound = false
	end
	self.Cmb01 = true
	self.Cmb02f = false
	self.Attacking = false
	end)
	end
	if self.Cmb02f then
	self.Cmb02f = false
	self:CICO(function()
	self.Fin2 = true
	self.Attacking = true
	if self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb01_fin") then
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 55
	self.Bound = false
	self.SetupType = DMG_SONIC
	self:PlaySequenceAndMove("dragon_cmb01_finw",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if self.Cmb03 then
	self.Cmb03 = false
	self:CICO(function()
	self.Fin2 = true
	self.Attacking = true
	if self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_cmb02") then
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 70
	self.SetupType = DMG_NEVERGIB
	self.Bound = true
	self:PlaySequenceAndMove("beast_cmb02_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Bound = false
	elseif self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb02") then
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("rush_cmb02_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb02") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 50
	self.NoDown = true
	self.Kuzushi = true
	self.SetupType = DMG_DIRECT
	self:PlaySequenceAndMove("dragon_cmb02_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Cmb03f = false
	self.Fin2 = false
	self.Attacking = false
	end)
	end
	if self.Cmb03f then
	self.Cmb03f = false
	self:CICO(function()
	self.Attacking = true
	if self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb02_fin") then
	self.Fin4 = true
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 60
	self.SetupType = DMG_DIRECT
	self.Kuzushi = false
	self.NoDown = false
	self.Attacking = false
	self:PlaySequenceAndMove("dragon_cmb02_finw",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Fin3 = false
	self.Cmb01 = true
	self.Cmb03fw = false
	self.Attacking = false
	end)
	end
	if self.Cmb04 then
	self.Cmb04 = false
	self:CICO(function()
	self.Fin3 = true
	self.Attacking = true
	if self.Beast and (self:GetSequenceName(self:GetSequence()) == "beast_cmb03") then
	self:EmitSound("kiryu/beast_style2.wav",85)
	self.Damage = 85
	self.SetupType = DMG_VEHICLE
	self.Overrunning = true
	self:PlaySequenceAndMove("beast_cmb03_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Overrunning = false
	elseif self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb03") then
	self:EmitSound("kiryu/attack_xl3.wav",85)
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("rush_cmb03_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb03") then
	self:EmitSound("kiryu/attack_xl3.wav",85)
	self.Damage = 55
	self.SetupType = DMG_ALWAYSGIB
	self:PlaySequenceAndMove("dragon_cmb03_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Cmb04f = false
	self.Attacking = false
	end)
	end
	if self.Cmb04f then
	self.Cmb04f = false
	self:CICO(function()
	self.Attacking = true
	if self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb03_fin") then
	self.Fin4 = true
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 65
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("dragon_cmb03_finw",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if self.Cmb05 then
	self.Cmb05 = false
	self:CICO(function()
	self.Fin4 = true
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb04") then
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 25
	self.SetupType = DMG_FALL
	self:PlaySequenceAndMove("rush_cmb04_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	elseif self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb04") then
	self:EmitSound("kiryu/attack_xl3.wav",85)
	self.Damage = 60
	self.SetupType = DMG_VEHICLE
	self:PlaySequenceAndMove("dragon_cmb04_fin",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Cmb05f = false
	end)
	end
	if self.Cmb05f then
	self.Cmb05f = false
	self:CICO(function()
	self.Attacking = true
	if self.Dragon and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb04_fin") then
	self.Fin3 = true
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 70
	self.Bound = true
	self.SetupType = DMG_VEHICLE
	self:PlaySequenceAndMove("dragon_cmb04_finw",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Bound = false
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if self.Cmb06 then
	self.Cmb06 = false
	self:CICO(function()
	self.Fin5 = true
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb05") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 25
	self:PlaySequenceAndMove("rush_cmb05_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	end)
	end
	if self.Cmb07 then
	self.Cmb07 = false
	self:CICO(function()
	self.Fin6 = true
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb06") then
	self:EmitSound("kiryu/attack_xl3.wav",85)
	self.Damage = 25
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("rush_cmb06_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if self.Cmb08 then
	self.Cmb08 = false
	self:CICO(function()
	self.Fin7 = true
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb07") then
	self:EmitSound("kiryu/attack_xl1.wav",85)
	self.Damage = 35
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("rush_cmb07_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	if self.Cmb09 then
	self.Cmb09 = false
	self:CICO(function()
	self.Fin8 = true
	self.Attacking = true
	if self.Rush and (self:GetSequenceName(self:GetSequence()) == "rush_cmb08") then
	self:EmitSound("kiryu/attack_xl2.wav",85)
	self.Damage = 75
	self.SetupType = DMG_NEVERGIB
	self:PlaySequenceAndMove("rush_cmb08_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	end
	self.Cmb01 = true
	self.Attacking = false
	end)
	end
	end}},
	[KEY_F] = {{coroutine = false,onbuttondown=function(self)
		if not self.Combat then
			if self:IsDead() or self.Taunting or self.Dodge or self.Downed or self.Flinching then return end
			if not self:IsRunning() and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 then
			self.Cmb01 = false
			self:CICO(function()
				for k,door in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,75)), 50)) do
					if not self.KickSafety and IsValid(door) and door:GetClass() == "prop_door_rotating" and door:GetInternalVariable( "m_eDoorState" ) == 0 and not door:GetInternalVariable( "m_bLocked" ) and GetConVarNumber("drg_yakuza_doorbust") == 1 then
						local fwd = door:GetPos()+door:GetForward()*5
						local bck = door:GetPos()-door:GetForward()*5
						local pos = self:GetPos()
						self.KickSafety = true
						if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
						self:FaceInstant(door:GetPos()+door:GetRight()*-23)
						elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
						self:FaceInstant(door:GetPos()+door:GetRight()*-23)
						end
						self:PlaySequenceAndMove("tlk_kru_stand_door",1)
						self.Attacking = false
						self.Cmb01 = true
					end
				end
			if not self.KickSafety then
			if self.Emote == 1 then
			self:EmitSound("kiryu/talk/laugh.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_ok",1)
			elseif self.Emote == 2 then
			self:EmitSound("kiryu/talk/nod"..math.random(6)..".wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_yes",1)
			elseif self.Emote == 3 then
			self:EmitSound("kiryu/talk/negate"..math.random(4)..".wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_no",1)
			elseif self.Emote == 4 then
			self:EmitSound("kiryu/talk/angry.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_angry",1)
			elseif self.Emote == 5 then
			self:EmitSound("kiryu/talk/dissapointed.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_ase",1)
			elseif self.Emote == 6 then
			self:EmitSound("kiryu/talk/cry.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_sad",1)
			elseif self.Emote == 7 then
			self:EmitSound("kiryu/talk/laugh.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_smile",1)
			elseif self.Emote == 8 then
			self:EmitSound("kiryu/talk/question.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_quest",1)
			elseif self.Emote == 9 then
			self:EmitSound("kiryu/talk/notice.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_info_f",1)
			elseif self.Emote == 10 then
			self:EmitSound("kiryu/talk/notice.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_info_l",1)
			elseif self.Emote == 11 then
			self:EmitSound("kiryu/talk/notice.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_info_r",1)
			elseif self.Emote == 12 then
			self:EmitSound("kiryu/talk/nod"..math.random(6)..".wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_kansin",1)
			elseif self.Emote == 13 then
			self:EmitSound("kiryu/talk/wonder.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_surp",1)
			elseif self.Emote == 14 then
			self:EmitSound("kiryu/talk/hang_up.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_think",1)
			elseif self.Emote == 15 then
			self:PlaySequenceAndMove("tlk_kru_stand_sorry",1)
			elseif self.Emote == 16 then
			self:EmitSound("kiryu/talk/angry.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_away",1)
			elseif self.Emote == 17 then
			self:EmitSound("kiryu/talk/call"..math.random(2)..".wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_call",1)
			elseif self.Emote == 18 then
			self:EmitSound("kiryu/talk/dissapointed.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_gakkari",1)
			elseif self.Emote == 19 then
			self:EmitSound("kiryu/talk/nod"..math.random(6)..".wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_ojigi",1)
			elseif self.Emote == 20 then
			self:EmitSound("kiryu/talk/nod6.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_request",1)
			elseif self.Emote == 21 then
			self:EmitSound("kiryu/talk/laugh.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_eri_naoshi",1)
			elseif self.Emote == 22 then
			self:EmitSound("kiryu/talk/laugh.wav",85)
			self:PlaySequenceAndMove("tlk_kru_stand_happy",1)
			end
			end
			self.KickSafety = false
			self.Cmb01 = true
			end)
			end
		else
		if self.Combat and self.Dragon and IsValid(self.BoundTarget) and self.HeatC > 100 then 
	if self.BoundTarget.Tire then return end
	if self.Boundr1 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb01_fin" then
	self.HeatC = math.min(300,self.HeatC - 120)
	self.Boundr1 = false
	local ent = self.BoundTarget
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior") and not ent.CantGrab then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self.Target = ent
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb01_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos()+self:GetRight()*-13)
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb01_fin_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb01_fin_b_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb01_fin_b_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.Boundr2 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb02_fin" then
	self.HeatC = math.min(300,self.HeatC - 120)
	self.Boundr2 = false
	local ent = self.BoundTarget
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior") and not ent.CantGrab then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self.Target = ent
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb02_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos()+self:GetRight()*-8)
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb02_fin_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb02_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb02_fin_b_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.Boundr3 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb03_fin" then
	self.HeatC = math.min(300,self.HeatC - 120)
	self.Boundr3 = false
	local ent = self.BoundTarget
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior") and not ent.CantGrab then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self.Target = ent
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb03_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos()+self:GetRight()*-10)
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb03_fin_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb03_fin_b_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb03_fin_b_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if self.Boundr4 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb04_fin" then
	self.HeatC = math.min(300,self.HeatC - 120)
	self.Boundr4 = false
	local ent = self.BoundTarget
	if (ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" or ent.Category == "Yakuza Fiercest Warrior") and not ent.CantGrab then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	ent:StopParticles()
	self.Target = ent
		local fwd = ent:GetPos()+ent:GetForward()*1
		local bck = ent:GetPos()-ent:GetForward()*1
		local pos = self:GetPos()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb04_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb04_fin_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_cmb04_fin_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_cmb04_fin_b_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	end
	if self:IsDead() or self.Attacking or not self.Cmb01 or self.Taunting or self.StandingUp or self.Downing or self.StyleSwitching or self.Downed or self.Flinching or self.Dodge or self.Gowan or self.Guarding then return end
		local lockedOn = self:PossessionGetLockedOn()
		if self.Dragon then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 125 and not self:PossessionGetLockedOn().Tire and not self:PossessionGetLockedOn().CantGrab and self:PossessionGetLockedOn().Attacking then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downed = true
	self.Downed = true
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
	local ent = lockedOn
		self:CICO(function(self)
		self:SetVelocity(Vector(0,0,0))
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("dragon_counter_f_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:PlaySequenceAndMove("dragon_counter_f_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end 
	end
	end
		elseif self.Rush then
	if IsValid(lockedOn) then
	local pos = lockedOn:GetPos()
	if self:GetPos():Distance(pos) < 100 and not self:PossessionGetLockedOn().Tire and not self:PossessionGetLockedOn().CantGrab and self:PossessionGetLockedOn().Attacking then
	if self:PossessionGetLockedOn().Category == "Yakuza Kiwami" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza 0" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 5" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Kiwami 3" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Fiercest Warrior" and not self:PossessionGetLockedOn().Downed or self:PossessionGetLockedOn().Category == "Yakuza Ishin!" and not self:PossessionGetLockedOn().Downed then
	lockedOn.Downing = false
	lockedOn.Downed = false
	self.Downed = true
	self.HeatAction = true
	lockedOn.Attacking = false
	lockedOn.Blocking = false
	lockedOn.Dodging = false
	lockedOn.HeatAction = true
	self.Target = lockedOn
	local ent = lockedOn
		self:CICO(function(self)
		self:EmitSound("kiryu/attack_s3.wav",85)
		self:SetVelocity(Vector(0,0,0))
		local col = self:GetCollisionGroup()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:PlaySequenceAndMove("rush_guard_sabaki_sync")
		self:SetCollisionGroup(col)
		self.HeatAction = false
		self.Downed = false
		end)
		ent:CICO(function(ent)
		self.Boundcol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent.Downing = true
		ent:TakeDamage(0.1,self,self)
		ent:PlaySequenceAndMove("rush_guard_sabaki_sync1")
		ent:SetCollisionGroup(self.Boundcol)
		ent.HeatAction = false
		ent.Downed = false
		ent.Downing = false
		end)
	end 
	end
	end
	end
	if self:IsDead() or self.Taunting or self.Dodge or self.Downed or self.Flinching then return end
	if not self:IsRunning() and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 then
	self.Cmb01 = false
	self:CICO(function()
	self.Attacking = true
		for k,door in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,75)), 50)) do
			if not self.KickSafety and IsValid(door) and door:GetClass() == "prop_door_rotating" and door:GetInternalVariable( "m_eDoorState" ) == 0 and not door:GetInternalVariable( "m_bLocked" ) and GetConVarNumber("drg_yakuza_doorbust") == 1 then
				local fwd = door:GetPos()+door:GetForward()*5
				local bck = door:GetPos()-door:GetForward()*5
				local pos = self:GetPos()
				self.KickSafety = true
				if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
				self:FaceInstant(door:GetPos()+door:GetRight()*-23)
				elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
				self:FaceInstant(door:GetPos()+door:GetRight()*-23)
				end
				if self:GetPossessor():KeyDown(IN_JUMP) then
				self:PlaySequenceAndMove("dragon_atk_door_hand",1)
				else
				self:PlaySequenceAndMove("dragon_atk_door_kick",1)
				end
				self.Attacking = false
				self.Cmb01 = true
			end
		end
	if self.Rush and not self.KickSafety then
	self.Damage = 15
	self.SetupType = DMG_SONIC
	self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	self.GuardBreak = true
	self.NoDown = true
	self:PlaySequenceAndMove("rush_atk_sp",1)
	self.GuardBreak = false
	self.NoDown = false
	end
	self.KickSafety = false
	self.Attacking = false
	self.Cmb01 = true
	end)
	end
	end
	end}},
	[KEY_2] = {{coroutine = true,onbuttondown=function(self)
		if not self.Combat and not self.Rush then
		self.Dragon = false
		self.Rush = true
		self.Beast = false
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		end
		if self.Combat and not self.Rush then
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		self:EmitSound("kiryu/rush_style"..math.random(2)..".wav",85)
		self.IdleAnimation = "rush_shift_idle"
		self.WalkAnimation = "rush_shift"
		self.RunAnimation = "rush_run"
		self.Dragon = false
		self.Rush = true
		self.Beast = false
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
		end
		if self.ThemeSongLoop2 then 
		self.ThemeSongLoop2:Stop()
		end
		if self.ThemeSongLoop3 then 
		self.ThemeSongLoop3:Stop()
		end
		if self.ThemeSongLoop4 then 
		self.ThemeSongLoop4:Stop()
		end
		if self.ThemeSongLoop5 then 
		self.ThemeSongLoop5:Stop()
		end
		if self.ThemeSongLoop7 then 
		self.ThemeSongLoop7:Stop()
		end
		if self.ThemeSongLoop8 then 
		self.ThemeSongLoop8:Stop()
		end
		if !self.ThemeSongLoop6 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop6 = CreateSound(game.GetWorld(),"kiryu/songs/touristtrap_c.wav", filter)
			self.ThemeSongLoop6:SetSoundLevel(0)
		end
		self.ThemeSongLoop6:Play()
		end
		self:EmitSound("yakuza0/style.wav",511)
		self.Taunting = true
		self:SetVelocity(Vector(0,0,0))
		//game.SetTimeScale(0.2)
		//self.StyleSwitching = true
		self:PlaySequenceAndMove("into_rush",1)
		//game.SetTimeScale(1)
		self.Taunting = false
		end
	end}},
	[KEY_1] = {{coroutine = true,onbuttondown=function(self)
		if not self.Combat and not self.Dragon then
		self.Dragon = true
		self.Rush = false
		self.Beast = false
		self:EmitSound("kiryu/dragon_style"..math.random(4)..".wav",85)
		self.IdleAnimation = "dragon_shift_idle"
		self.WalkAnimation = "dragon_shift"
		self.RunAnimation = "kiryu_run"
		self.Dragon = true
		self.Rush = false
		self.Beast = false
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
		end
		if self.ThemeSongLoop2 then 
		self.ThemeSongLoop2:Stop()
		end
		if self.ThemeSongLoop3 then 
		self.ThemeSongLoop3:Stop()
		end
		if self.ThemeSongLoop4 then 
		self.ThemeSongLoop4:Stop()
		end
		if self.ThemeSongLoop6 then 
		self.ThemeSongLoop6:Stop()
		end
		if self.ThemeSongLoop7 then 
		self.ThemeSongLoop7:Stop()
		end
		if self.ThemeSongLoop5 then 
		self.ThemeSongLoop5:Stop()
		end
		if !self.ThemeSongLoop8 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop8 = CreateSound(game.GetWorld(),"kiryu/songs/kamuroagain.wav", filter)
			self.ThemeSongLoop8:SetSoundLevel(0)
		end
		self.ThemeSongLoop8:Play()
		end
		self:EmitSound("yakuza0/style.wav",511)
		self:SetVelocity(Vector(0,0,0))
		self.Taunting = true
		//game.SetTimeScale(0.2)
		//self.StyleSwitching = true
		self:PlaySequenceAndMove("dragonstyle",1)
		//game.SetTimeScale(1)
		self.Taunting = false
		end
	end}},
	[KEY_5] = {{coroutine = true,onbuttondown=function(self)
		if self.Combat then
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		end
		self.Combat = false
		if self.ThemeSongLoop then 
			self.ThemeSongLoop:FadeOut(2)
		end
		if self.ThemeSongLoop2 then 
			self.ThemeSongLoop2:FadeOut(2)
		end
		if self.ThemeSongLoop3 then 
			self.ThemeSongLoop3:FadeOut(2)
		end
		if self.ThemeSongLoop4 then 
			self.ThemeSongLoop4:FadeOut(2)
		end
		if self.ThemeSongLoop5 then 
			self.ThemeSongLoop5:FadeOut(2)
		end
		if self.ThemeSongLoop6 then 
			self.ThemeSongLoop6:FadeOut(2)
		end
		if self.ThemeSongLoop7 then 
			self.ThemeSongLoop7:FadeOut(2)
		end
		if self.ThemeSongLoop8 then 
			self.ThemeSongLoop8:FadeOut(2)
		end
		self.IdleAnimation = "kiryu_idle"
		self.WalkAnimation = "kiryu_walk"
		self.RunAnimation = "kiryu_run"
		end
	end}},
	[KEY_6] = {{coroutine = true,onbuttondown=function(self)
		if self:Health() == self:GetMaxHealth() then return end
		if self.ToughnessZ > 0 and self:GetCooldown("Healy")<=0 then
		self:SetCooldown("Healy",1)
		self.ToughnessZ = math.min(5,self.ToughnessZ - 1)
		self:SetHealth(self:Health() + 300)
		if self:Health() > self:GetMaxHealth() then
		self:SetHealth(self:GetMaxHealth())
		end
		end
	end}},
	[IN_RELOAD] = {{coroutine = true,onkeydown = function(self)
		if not self.Combat then
		self.Combat = true
		if self.Rush then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop2 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop2 = CreateSound(game.GetWorld(),"kiryu/songs/touristtrap.wav", filter)
			self.ThemeSongLoop2:SetSoundLevel(0)
		end
		self.ThemeSongLoop2:Play()
		end
		self.Taunting = true
		self:PlaySequenceAndMove("dragon_btlst",1)
		self:EmitSound("kiryu/rush_style"..math.random(2)..".wav",85)
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		self:EmitSound("yakuza0/gage_heat.wav",511)
		ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		self:PlaySequenceAndMove("btlst_to_rush",1)
		self.Taunting = false
		self.IdleAnimation = "rush_shift_idle"
		self.WalkAnimation = "rush_shift"
		self.RunAnimation = "rush_run"
		elseif self.Beast then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop3 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop3 = CreateSound(game.GetWorld(),"kiryu/songs/yokohamatussle.wav", filter)
			self.ThemeSongLoop3:SetSoundLevel(0)
		end
		self.ThemeSongLoop3:Play()
		end
		self.Taunting = true
		self:PlaySequenceAndMove("dragonbtlst",1)
		self:EmitSound("kiryu/beast_style"..math.random(2)..".wav",85)
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		self:EmitSound("yakuza0/gage_heat.wav",511)
		ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		self:PlaySequenceAndMove("btlst_to_beast",1)
		self.Taunting = false
		self.IdleAnimation = "beast_shift_idle"
		self.WalkAnimation = "beast_shift"
		self.RunAnimation = "beast_walk"
		elseif self.Dragon then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop4 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop4 = CreateSound(game.GetWorld(),"kiryu/songs/kamuroagain.wav", filter)
			self.ThemeSongLoop4:SetSoundLevel(0)
		end
		self.ThemeSongLoop4:Play()
		end
		self.Taunting = true
		self:PlaySequenceAndMove("dragon_btlst",1)
		self:EmitSound("kiryu/dragon_style"..math.random(4)..".wav",85)
		self.Taunting = false
		self.IdleAnimation = "dragon_shift_idle"
		self.WalkAnimation = "dragon_shift"
		self.RunAnimation = "kiryu_run"
		end
		else
		self.Taunting = true
		if self.Beast then
		self:EmitSound("kiryu/beast_taunt.wav",100)
		self:PlaySequenceAndMove("beast_taunt",1)
		elseif self.Rush then
		self:EmitSound("kiryu/rush_taunt.wav",100)
		self:PlaySequenceAndMove("rush_taunt",1)
		elseif self.Dragon then
		self:EmitSound("kiryu/provo"..math.random(2)..".wav",100)
		self:PlaySequenceAndMove("dragon_taunt",1)
		end
		self.Taunting = false
		end
	end}},
	[IN_GRENADE1] = {{coroutine = true,onkeydown = function(self)
	if not self.Step1 then
	self.Step1 = true
	end
	if self.Step2 or self.Step4 then
	self.Step2 = false
	self.Step3 = false
	self.Step4 = false
	end
	end}},
	[IN_GRENADE2] = {{coroutine = true,onkeydown = function(self)
	if self.Step1 and not self.Step2 then
	self.Step2 = true
	end
	end}},
	[IN_ALT1] = {{coroutine = true,onkeydown = function(self)
	if self.Step1 and not self.Step2 then
	self.Step1 = false
	end
	if self.Step1 and self.Step2 and not self.Step3 then
	self.Step3 = true
	end
	end}},
	[IN_USE] = {{coroutine = false,onkeydown = function(self)
	if self.Air and not self.DownSafety and self.Dragon and not self:IsDead() then
	self.DownSafety = true
	self:SetCooldown("MajimaDodgeAnim",1)
	if self:GetPossessor():KeyDown(IN_FORWARD) then
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Dodge = true
		self:PlaySequenceAndMove("dragon_antidown_f",1)
		self.Dodge = false
	end)
	elseif self:GetPossessor():KeyDown(IN_BACK) then
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Dodge = true
		self:PlaySequenceAndMove("dragon_antidown_b",1)
		self.Dodge = false
	end)
	elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Dodge = true
		self:PlaySequenceAndMove("dragon_antidown_r",1)
		self.Dodge = false
	end)
	elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Dodge = true
		self:PlaySequenceAndMove("dragon_antidown_l",1)
		self.Dodge = false
	end)
	else
  	self:CICO(function()
		self.Air = false
		self.Downing = false
		self.DownSafety = false
		self.Downed = false
		self.Dodge = true
		self:PlaySequenceAndMove("dragon_antidown_f",1)
		self.Dodge = false
	end)
	end
	end
	if self.Downing then
  	self:CallInCoroutine(function()
	self.Downing = false
	end)
	end
	if self.Downed then
  	self:CallInCoroutine(function()
	self.Downed = false
	end)
	end
	if self.StandingUp then
  	self:CallInCoroutine(function()
	self.StandingUp = false
	end)
	end
	if (self:GetSequenceName(self:GetSequence()) == "down_f") and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
  	self:CICO(function()
		self.DownSafety = false
		self:PlaySequenceAndMove("kiryu_standup_f",1)
		self.StandingUp = false
	end)
	elseif (self:GetSequenceName(self:GetSequence()) == "down_b") and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
  	self:CICO(function()
		self.DownSafety = false
		self:PlaySequenceAndMove("kiryu_standup_b",1)
		self.StandingUp = false
	end)
	elseif (self:GetSequenceName(self:GetSequence()) == "down_fatal_f_lp") and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
  	self:CICO(function()
		self.DownSafety = false
		self:PlaySequenceAndMove("down_fatal_f_en",1)
		self.StandingUp = false
	end)
	elseif (self:GetSequenceName(self:GetSequence()) == "down_fatal_b_lp") and not self.DownSafety and self.Downed and not self:IsDead() then
	self.DownSafety = true
  	self:CICO(function()
		self.DownSafety = false
		self:PlaySequenceAndMove("down_fatal_b_en",1)
		self.StandingUp = false
	end)
	end
	if self.Grabbed and IsValid(self.Grabber) and not self.GrabbedSafety and not self:IsDead() then
	self.GrabSafety = true
	print(self.Grabber)
	local ent = self.Grabber
	ent:GrabRelease()
	self.GrabSafety = false
	self.Grabbed = false
	self.Grabber = nil
	end
	if self:IsDead() or self.DownSafety or self.DownSafety2 or self.Stunned or not self.Combat or self.Taunting or self.Downed or self.Downing or self.StandingUp then return end
	if not self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 and not self.Cmb09f and self.Rush and not self.Dodge and not self.Dodge2 and not self.Dodge3 and not self.Dodge3D or not self.Dodge and not self.Dodge2 and not self.Dodge3 and not self.Dodge3D and self.Flinching and self.Rush then
		self.Attacking = false
		self.Dodge = true
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.Flinching = false
	self:EmitSound("yakuza0/sway"..math.random(3)..".wav")
		if self:GetPossessor():KeyDown(IN_FORWARD) then
   self:CICO(function()
		if self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self.Dodge2 = true
		self:PlaySequenceAndMove("rush_weave_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
   self:CICO(function()
		if self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self.Dodge2 = true
		self:PlaySequenceAndMove("rush_weave_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
   self:CICO(function()
		if self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self.Dodge2 = true
		self:PlaySequenceAndMove("rush_weave_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
   self:CICO(function()
		if self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self.Dodge2 = true
		self:PlaySequenceAndMove("rush_weave_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		else
   self:CICO(function()
		if self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self.Dodge2 = true
		self:PlaySequenceAndMove("rush_weave_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
	end
	end
	if self:GetCooldown("KiryuDodgeAnim")<=0 and not self.Dodge and not self.Dodge2 and not self.Dodge3 and not self.Dodge3D and self.Cmb01 and not self.Cmb02 and not self.Cmb03 and not self.Cmb04 and not self.Cmb05 and not self.Cmb06 and not self.Cmb07 and not self.Cmb08 and not self.Cmb09 and not self.Cmb09f and not self.Flinching then
		self.Attacking = false
		self.Dodge = true
	self:EmitSound("yakuza0/sway"..math.random(3)..".wav")
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		self:CICO(function()
		if self.Beast then
		self:SetCooldown("KiryuDodgeAnim",1)
		self:PlaySequenceAndMove("beast_sway_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.15)
		self:PlaySequenceAndMove("dragon_sway_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
   self:CICO(function()
		if self.Beast then
		self:SetCooldown("KiryuDodgeAnim",1)
		self:PlaySequenceAndMove("beast_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.15)
		self:PlaySequenceAndMove("dragon_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
   self:CICO(function()
		if self.Beast then
		self:SetCooldown("KiryuDodgeAnim",1)
		self:PlaySequenceAndMove("beast_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.15)
		self:PlaySequenceAndMove("dragon_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
   self:CICO(function()
		if self.Beast then
		self:SetCooldown("KiryuDodgeAnim",1)
		self:PlaySequenceAndMove("beast_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.15)
		self:PlaySequenceAndMove("dragon_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		else
   self:CICO(function()
		if self.Beast then
		self:SetCooldown("KiryuDodgeAnim",1)
		self:PlaySequenceAndMove("beast_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self.Dodge2 = true
		self:SetCooldown("KiryuDodgeAnim",0.15)
		self:PlaySequenceAndMove("dragon_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge2 = false
   end)
		end
	end
	if self:GetCooldown("KiryuDodgeAnim")<=0 and not self.Dodge3 and not self.Dodge3D and self.Dodge2 and (self.Rush or self.Dragon) then
		self.Attacking = false
		self.Dodge3 = true
	self:EmitSound("yakuzakiwami/sway"..math.random(3)..".wav")
		if self:GetPossessor():KeyDown(IN_FORWARD) then
   self:CICO(function()
		self.Dodge2 = false
		if self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.7)
		self:PlaySequenceAndMove("dragon_sway_f_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_02_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
   self:CICO(function()
		self.Dodge2 = false
		if self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.7)
		self:PlaySequenceAndMove("dragon_sway_r_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_02_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
   self:CICO(function()
		self.Dodge2 = false
		if self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.7)
		self:PlaySequenceAndMove("dragon_sway_b_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_02_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3 = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
   self:CICO(function()
		self.Dodge2 = false
		if self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.7)
		self:PlaySequenceAndMove("dragon_sway_l_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("rush_sway_02_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3 = false
   end)
		else
		self:SetCooldown("KiryuDodgeAnim",0.7)
   self:CICO(function()
		self.Dodge2 = false
		if self.Dragon then
		self:PlaySequenceAndMove("dragon_sway_b_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:PlaySequenceAndMove("rush_sway_02_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3 = false
   end)
	end
	end
	if self:GetCooldown("KiryuDodgeAnim")<=0 and not self.Dodge2 and self.Dodge3 and not self.Dodge3D and (self.Rush or self.Dragon) then
		self.Attacking = false
		self.Dodge3D = true
	self:EmitSound("yakuza0/sway"..math.random(3)..".wav")
		if self:GetPossessor():KeyDown(IN_FORWARD) then
		self:SetCooldown("KiryuDodgeAnim",0.2)
   self:CICO(function()
		self.Dodge3 = false
		if self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("dragon_sway_f_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:PlaySequenceAndMove("rush_sway_03_f",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3D = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVERIGHT) then
		self:SetCooldown("KiryuDodgeAnim",0.2)
		self.Dodge3D = true
   self:CICO(function()
		self.Dodge3 = false
		if self.Rush then
		self.Dodge3 = false
		self.Dodge3D = true
		self:PlaySequenceAndMove("rush_sway_03_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("dragon_sway_r_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3D = false
   end)
		elseif self:GetPossessor():KeyDown(IN_BACK) then
		self:SetCooldown("KiryuDodgeAnim",0.2)
		self.Dodge3D = true
   self:CICO(function()
		self.Dodge3 = false
		if self.Rush then
		self.Dodge3 = false
		self:PlaySequenceAndMove("rush_sway_03_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("dragon_sway_b_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3D = false
   end)
		elseif self:GetPossessor():KeyDown(IN_MOVELEFT) then
		self:SetCooldown("KiryuDodgeAnim",0.2)
		self.Dodge3D = true
   self:CICO(function()
		self.Dodge3 = false
		if self.Rush then
		self.Dodge3 = false
		self.Dodge3D = true
		self:PlaySequenceAndMove("rush_sway_03_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("dragon_sway_l_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3D = false
   end)
		else
		self:SetCooldown("KiryuDodgeAnim",0.5)
		self.Dodge3D = true
   self:CICO(function()
		self.Dodge3 = false
		if self.Rush then
		self.Dodge3 = false
		self.Dodge3D = true
		self:PlaySequenceAndMove("rush_sway_03_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:SetCooldown("KiryuDodgeAnim",0.3)
		self:PlaySequenceAndMove("dragon_sway_b_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCooldown("KiryuAttack",0)
		self.Dodge = false
		self.Dodge3D = false
   end)
	end
	end
	end}},
	[4] = {{coroutine = true,onkeydown = function(self)
	if self:IsDead() or self.Downed or self.Dodge then return end
	if self.Brawler then
	self.Blocking = true
	self.GuardHP = 100
	self:PlaySequenceAndMove("brawler_guard_st")
	while self:GetPossessor():KeyDown(IN_DUCK) and self.Blocking do
		self:PlaySequenceAndMove("brawler_guard_lp")
	end
	if self.Blocking then
	self.Blocking = false
	self:PlaySequenceAndMove("brawler_guard_en")
	end
	elseif self.Rush then
	self.GuardHP = 100
	self.Blocking = true
	self:PlaySequenceAndMove("rush_guard_st_weave")
	while self:GetPossessor():KeyDown(IN_DUCK) and self.Blocking do
		self:PlaySequenceAndMove("rush_guard_lp")
	end
	if self.Blocking then
	self.Blocking = false
	self:PlaySequenceAndMove("rush_guard_en")
	end
	elseif self.Beast then
	self.GuardHP = 100
	self.Gowan = true
	self:EmitSound("kiryu/attack_s_guard.wav",85)
	self:SetCooldown("Invincible",self:GetCooldown("Invincible")+0.5)
	self:PlaySequenceAndMove("beast_guard_st")
	while self:GetPossessor():KeyDown(IN_DUCK) and self.Gowan do
		self:PlaySequenceAndMove("beast_guard_lp")
	end
	if self.Gowan then
	self.Gowan = false
	self:PlaySequenceAndMove("beast_guard_en")
	end
	elseif self.Dragon then
	self.GuardHP = 150
	self.Blocking = true
	self:PlaySequenceAndMove("dragon_guard_st")
	while self:GetPossessor():KeyDown(IN_DUCK) and self.Blocking do
		self:PlaySequenceAndMove("dragon_guard_lp")
	end
	if self.Blocking then
	self.Blocking = false
	self:PlaySequenceAndMove("dragon_guard_en")
	end
	end
	end,onbuttondown=function(self)
		if not self.Combat and not self.Beast then
		self.Dragon = false
		self.Rush = false
		self.Beast = true
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		end
		if self.Combat and not self.Beast then
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
		self:EmitSound("kiryu/beast_style"..math.random(2)..".wav",85)
		self.IdleAnimation = "beast_shift_idle"
		self.WalkAnimation = "beast_shift"
		self.RunAnimation = "beast_walk"
		self.Dragon = false
		self.Rush = false
		self.Beast = true
		self:EmitSound("yakuza0/style.wav",511)
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
		end
		if self.ThemeSongLoop2 then 
		self.ThemeSongLoop2:Stop()
		end
		if self.ThemeSongLoop3 then 
		self.ThemeSongLoop3:Stop()
		end
		if self.ThemeSongLoop4 then 
		self.ThemeSongLoop4:Stop()
		end
		if self.ThemeSongLoop6 then 
		self.ThemeSongLoop6:Stop()
		end
		if self.ThemeSongLoop5 then 
		self.ThemeSongLoop5:Stop()
		end
		if self.ThemeSongLoop8 then 
		self.ThemeSongLoop8:Stop()
		end
		if !self.ThemeSongLoop7 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop7 = CreateSound(game.GetWorld(),"kiryu/songs/yokohamatussle_c.wav", filter)
			self.ThemeSongLoop7:SetSoundLevel(0)
		end
		self.ThemeSongLoop7:Play()
		end
		self.Taunting = true
		self:SetVelocity(Vector(0,0,0))
		//game.SetTimeScale(0.2)
		//self.StyleSwitching = true
		self:PlaySequenceAndMove("into_beast",1)
		//game.SetTimeScale(1)
		self.Taunting = false
		end
	end}},
	[IN_SCORE] = {{coroutine = true,onkeydown = function(self)
	if self:IsDead() or self.Downed or self.Downing or self.StandingUp or self.Dodge or self.Attacking then return end
	if not self.Combat and (self:GetBodygroup(1) != 1) then
	self.Taunting = true
	self:PlaySequenceAndMove("tlk_kru_stand_smoke_a_st")
	while self:GetPossessor():KeyDown(IN_SCORE) do
		self:PlaySequenceAndMove("tlk_kru_stand_smoke_a_lp")
	end
	if math.random(2)==1 then
	self:PlaySequenceAndMove("tlk_kru_stand_smoke_a_en2")
	else
	self:PlaySequenceAndMove("tlk_kru_stand_smoke_a_en")
	end
	self.Taunting = false
	self:SetBodygroup(2,0)
	self:SetBodygroup(1,0)
	if IsValid(self.CigHelp) then
		self.CigHelp:Remove()
	end
	elseif self.Combat and (self:GetBodygroup(1) == 0) then
	self.Tire = true
	self:PlaySequenceAndMove("tobacco")
	self.Tire = false
	end
	end}},
}
ENT.IdleAnimation = "kiryu_idle"
ENT.WalkAnimation = "kiryu_walk"
ENT.RunAnimation = "kiryu_run"
ENT.JumpAnimation = "fall"
	
if SERVER then
function ENT:PossessionControls(f,b,r,l)
	if not self:IsRunning() and self.Combat and not self.Runner then
		if self:IsMoving() then
		self:PossessionFaceForward()
		end
		local direction = self:GetPos()
		if f then direction = direction + self:PossessorForward()
		elseif b then direction = direction - self:PossessorForward() end
		if r then direction = direction + self:PossessorRight()
		elseif l then direction = direction - self:PossessorRight() end
		if direction ~= self:GetPos() then self:MoveTowards(direction) self:PossessionFaceForward() end
	else
		local direction = self:GetPos()
		if f then direction = direction + self:PossessorForward()
		elseif b then direction = direction - self:PossessorForward() end
		if r then direction = direction + self:PossessorRight()
		elseif l then direction = direction - self:PossessorRight() end
		if direction ~= self:GetPos() then self:FaceTowards(direction) self:MoveForward(direction) end
	end
end
function ENT:CustomInitialize()
	self.Combat = false
	self.Dodge = false
	self.Attacking = false
	self.Cmb01 = true
	self.Dragon = true
	self.Beast = false
	self.Rush = false
	self.Safety = true
	self.Flinches = 0
	self.DFlinches = 0
	self.HeatC = 0
	self.ToughnessZ = 1
	self.Style = 1
	self.BuildUp = 0
	self.BETarget1 = nill
	self.BETarget2 = nill
	self.BETarget3 = nill
	self.BETarget4 = nill
	self.Stamina = 100
	self.Emote = 1
	for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") then self:SetAttack(v,true)end end
	self:SetDefaultRelationship(D_HT)
	self:SetPlayersRelationship(D_LI)
end
function ENT:OnLandOnGround()
	if self:IsDead() or self:IsDown() or self.Downed then return end
	self:CICO(function(self, delay)
		self:EmitSound("common/body2.wav")
		self:PlaySequenceAndMove("land",1)
	end)
end

ENT.SetupType = bit.bor(DMG_GENERIC)
function ENT:HandleAnimEvent(a,b,c,d,e)
	if e == "attack" then
	self.Dodge = false
	self.Dodge2 = false
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=50,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
			if self.TigerDrop then
				if self.Brawler then
					self:EmitSound("yakuzakiwami/weapons/fists/dragon/fin12.wav",85)
				else
					self:EmitSound("yakuzakiwami/tigerdrop.wav",85)
				end
			else
				if self.Brawler then
					if self.Fin1 then
					self:EmitSound("yakuzakiwami/weapons/fists/brawler/fin01_"..math.random(2)..".wav",85)
					self.Fin1 = false
					elseif self.Fin2 then
					self:EmitSound("yakuzakiwami/weapons/fists/brawler/fin02_"..math.random(2)..".wav",85)
					self.Fin2 = false
					elseif self.Fin3 then
					self:EmitSound("yakuzakiwami/weapons/fists/brawler/fin03_"..math.random(2)..".wav",85)
					self.Fin3 = false
					elseif self.Fin4 then
					self:EmitSound("yakuzakiwami/weapons/fists/brawler/fin04_"..math.random(2)..".wav",85)
					self.Fin4 = false
					else
					self:EmitSound("yakuzakiwami/weapons/fists/brawler/hit"..math.random(4)..".wav")
					end
				elseif self.Rush then
					if self.Fin1 or self.Fin2 or self.Fin3 or self.Fin4 or self.Fin5 then
					self:EmitSound("yakuzakiwami/weapons/fists/rush/fin123.wav",85)
					self.Fin1 = false
					self.Fin2 = false
					self.Fin3 = false
					self.Fin4 = false
					self.Fin5 = false
					elseif self.Fin6 or self.Fin7 then
					self:EmitSound("yakuzakiwami/weapons/fists/rush/fin05_"..math.random(2)..".wav")
					self.Fin6 = false
					self.Fin7 = false
					elseif self.Fin8 then
					self:EmitSound("yakuzakiwami/weapons/fists/rush/fin23.wav",85)
					self.Fin8 = false
					else
						if self.Kick then
						self:EmitSound("yakuzakiwami/weapons/fists/rush/hit_kick"..math.random(4)..".wav")
						else
						self:EmitSound("yakuzakiwami/weapons/fists/rush/hit"..math.random(8)..".wav")
						end
					end
				elseif self.Beast then
					if self.Fin1 then
					self:EmitSound("yakuzakiwami/weapons/fists/beast/fin01_"..math.random(2)..".wav",85)
					self.Fin1 = false
					elseif self.Fin2 then
					self:EmitSound("yakuzakiwami/weapons/fists/beast/fin02_"..math.random(2)..".wav",85)
					self.Fin2 = false
					elseif self.Fin3 then
					self:EmitSound("yakuzakiwami/weapons/fists/beast/fin034_"..math.random(2)..".wav",85)
					self.Fin3 = false
					else
					self:EmitSound("yakuzakiwami/weapons/fists/beast/hit"..math.random(8)..".wav")
					end
				elseif self.Dragon then
					if self.Fin1 then
					self:EmitSound("kiryu/battlesfx/fin1_"..math.random(2)..".wav",85)
					self.Fin1 = false
					elseif self.Fin2 then
					self:EmitSound("kiryu/battlesfx/fin2_"..math.random(2)..".wav",85)
					self.Fin2 = false
					elseif self.Fin3 then
					self:EmitSound("kiryu/battlesfx/fin3.wav",85)
					self.Fin3 = false
					elseif self.Fin4 then
					self:EmitSound("kiryu/battlesfx/fin4.wav",85)
					self.Fin4 = false
					else
					self:EmitSound("kiryu/battlesfx/hit"..math.random(5)..".wav")
					end
				end
			end
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
			if self.TigerDrop then
				if self.Brawler then
					self:EmitSound("yakuzakiwami/weapons/fists/dragon/fin12.wav",85)
				else
					self:EmitSound("yakuzakiwami/tigerdrop.wav",85)
				end
			else
				if self.Brawler then
				self:EmitSound("yakuzakiwami/weapons/fists/brawler/swing"..math.random(2)..".wav")
				elseif self.Rush then
					if self.Kick then
					self:EmitSound("yakuzakiwami/weapons/fists/rush/swing_kick.wav")
					else
					self:EmitSound("yakuzakiwami/weapons/fists/rush/swing"..math.random(2)..".wav")
					end
				elseif self.Beast then
				self:EmitSound("yakuzakiwami/weapons/fists/beast/swing"..math.random(2)..".wav")
				elseif self.Dragon then
				self:EmitSound("kiryu/battlesfx/swing"..math.random(4)..".wav")
				end
			end
			end
		end)
	end
	if e == "attackg2" then
		self:Attack({
			damage = 25,
			type = DMG_GENERIC,
			range=40,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("yakuza0/weapons/fists/dragon/fin45.wav",85)
			else
				self:EmitSound("yakuza0/weapons/fists/brawler/swing"..math.random(2)..".wav")
			end
		end)
	end
	if e == "grab" then
		self:Attack({
			damage = 1,
			type = DMG_GENERIC,
			range=40,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("yakuza0/weapons/fists/beast/swing"..math.random(2)..".wav")
			else
				self:EmitSound("yakuza0/weapons/fists/beast/swing"..math.random(2)..".wav")
			end
		end)
	end
	if e == "spinattack" then
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=50,
			angle=360,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("kiryu/battlesfx/fin2_2.wav",85)
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("kiryu/battlesfx/swingkick"..math.random(3)..".wav")
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
	if e == "heatattack" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuCrushDamage")<=0 then
			self.Target:TakeDamage(200, self, self)
			else
			self.Target:TakeDamage(100, self, self)
			end
		end
	end
	if e == "slapattack" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuSlapDamage")<=0 then
			self.Target:TakeDamage(60, self, self)
			else
			self.Target:TakeDamage(30, self, self)
			end
		end
	end
	if e == "slapattackfinal" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuSlapDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "fattack" then
		self:Attack({
			damage = self.Damage,
			type = self.SetupType,
			range=50,
			viewpunch = Angle(20, math.random(-10, 10), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("yakuza0/weapons/fists/beast/fin02_"..math.random(2)..".wav",85)
				self.Fin2 = false
				self:CICO(function()
				self.Damage = 15
				self.SetupType = DMG_GENERIC
				self:PlaySequenceAndMove("beast_cmb02_fin_hit",1)
				self.Bound = false
				end)
				local m = math.random(4)
				if m==3 then self.ShouldTaunt = true end
			else
				self:EmitSound("yakuza0/weapons/fists/beast/swing"..math.random(2)..".wav")
			end
		end)
	end
	if e == "begrunst" then
		if self:IsPossessed() then
		self.Loops = 0
		self.Charging = true
		else
		end
	end
	if e == "begrunlp" then
		if self:IsPossessed() then
		self.Loops = math.min(2,self.Loops + 1)
		else
		end
	end
	if e == "becmb01trans" then
		if self:IsPossessed() then
		self.Cmb02 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 55
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("beast_cmb01_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 35
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("beast_cmb02",1)
		end
		end)
		end
	end
	if e == "becmb02trans" then
		if self:IsPossessed() then
		self.Cmb03 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 55
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("beast_cmb02_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 40
		self:EmitSound("kiryu/attack_s4.wav",85)
		self:PlaySequenceAndMove("beast_cmb03",1)
		end
		end)
		end
	end
	if e == "becmb03trans" then
		if self:IsPossessed() then
		self.Cmb04 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 45
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("beast_cmb03_heavy",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 55
		self.Charge = true
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("beast_cmb03_fin",1)
		self.Charge = false
		end
		end)
		end
	end
	if e == "dcmb01trans" then
		if self:IsPossessed() then
		self.Cmb02 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 45
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("dragon_cmb01_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb02",self.DragonSpeed)
		end
		end)
		end
	end
	if e == "dcmb01ftrans" then
		if self:IsPossessed() then
		self.Cmb02f = true
		else
		self:CICO(function()
		self.Damage = 55
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb01_finw",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		end)
		end
	end
	if e == "dcmb02trans" then
		if self:IsPossessed() then
		self.Cmb03 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("dragon_cmb02_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self:EmitSound("kiryu/attack_s3.wav",85)
		self:PlaySequenceAndMove("dragon_cmb03",self.DragonSpeed)
		end
		end)
		end
	end
	if e == "dcmb02ftrans" then
		if self:IsPossessed() then
		self.Cmb03f = true
		else
		self:CICO(function()
		self.Damage = 60
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb02_finw",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		end)
		end
	end
	if e == "dcmb03trans" then
		if self:IsPossessed() then
		self.Cmb04 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 55
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("dragon_cmb03_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self:EmitSound("kiryu/attack_l2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb04",self.DragonSpeed)
		end
		end)
		end
	end
	if e == "dcmb03ftrans" then
		if self:IsPossessed() then
		self.Cmb04f = true
		else
		self:CICO(function()
		self.Damage = 65
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb03_finw",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		end)
		end
	end
	if e == "dcmb04trans" then
		if self:IsPossessed() then
		self.Cmb05 = true
		else
		self:CICO(function()
		self.Damage = 60
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("dragon_cmb04_fin",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end)
		end
	end
	if e == "dcmb04ftrans" then
		if self:IsPossessed() then
		self.Cmb05f = true
		else
		self:CICO(function()
		self.Damage = 70
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("dragon_cmb04_finw",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		end)
		end
	end
	if e == "dcmb05trans" then
		if self:IsPossessed() then
		self.Cmb06 = true
		else
		self:CICO(function()
		self.Damage = 60
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("EX_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end)
		end
	end
	if e == "dcmb06trans" then
		if self:IsPossessed() then
		self.Cmb07 = true
		else
		self:CICO(function()
		self.Damage = 60
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("EX_cmb02",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end)
		end
	end
	if e == "dcmb07trans" then
		if self:IsPossessed() then
		self.Cmb08 = true
		else
		self:CICO(function()
		self.Damage = 60
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("EX_cmb03",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		end)
		end
	end
	if e == "dcmb08trans" then
		if self:IsPossessed() then
		self.Cmb09 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 55
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("EX_cmb05",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		else
		self.Damage = 30
		self:EmitSound("kiryu/attack_l2.wav",85)
		self:PlaySequenceAndMove("EX_cmb04",self.DragonSpeed)
		end
		end)
		end
	end
	if e == "rcmb01trans" then
		if self:IsPossessed() then
		self.Cmb02 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("rush_cmb01_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("rush_cmb02",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb02trans" then
		if self:IsPossessed() then
		self.Cmb03 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("rush_cmb02_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s3.wav",85)
		self:PlaySequenceAndMove("rush_cmb03",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb03trans" then
		if self:IsPossessed() then
		self.Cmb04 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("rush_cmb03_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s1.wav",85)
		self:PlaySequenceAndMove("rush_cmb04",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb04trans" then
		if self:IsPossessed() then
		self.Cmb05 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("rush_cmb04_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("rush_cmb05",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb05trans" then
		if self:IsPossessed() then
		self.Cmb06 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("rush_cmb05_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s3.wav",85)
		self:PlaySequenceAndMove("rush_cmb06",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb06trans" then
		if self:IsPossessed() then
		self.Cmb07 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl1.wav",85)
		self:PlaySequenceAndMove("rush_cmb06_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s1.wav",85)
		self:PlaySequenceAndMove("rush_cmb07",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb07trans" then
		if self:IsPossessed() then
		self.Cmb08 = true
		else
		self:CICO(function()
		local cmb = math.random(1,3)
		if cmb==2 then
		self.Damage = 50
		self:EmitSound("kiryu/attack_xl2.wav",85)
		self:PlaySequenceAndMove("rush_cmb07_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		else
		self.Damage = 15
		self:EmitSound("kiryu/attack_s2.wav",85)
		self:PlaySequenceAndMove("rush_cmb08",self.RushSpeed)
		end
		end)
		end
	end
	if e == "rcmb08trans" then
		if self:IsPossessed() then
		self.Cmb09 = true
		else
		self:CICO(function()
		self.Damage = 45
		self:EmitSound("kiryu/attack_xl3.wav",85)
		self:PlaySequenceAndMove("rush_cmb08_fin",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
		if self.Heat then
		self:SetCooldown("KiryuAttack",math.random(0.5,1))
		else
		self:SetCooldown("KiryuAttack",math.random(2.5,4))
		end
		self.Attacking = false
		end)
		end
	end
	if e == "bwalk" then
		if self.BuildUp == 3 then
		self.RunAnimation = "beast_run"
		else
		self.BuildUp = math.min(3,self.BuildUp + 1)
		end
	end
	if e == "brawlertaunt" then
		self:EmitSound("kiryu/provo"..math.random(2)..".wav")
		self.HeatC = math.min(300,self.HeatC + 40)
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsAlive() and v.CanAngry and self:IsInRange(v,self.RangeAttackRange) then
				v:SetEnemy(self)
				v:Angery()
			end
		end
	end
	if e == "dragontaunt" then
		self.HeatC = math.min(300,self.HeatC + 50)
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsAlive() and v.CanAngry and self:IsInRange(v,self.RangeAttackRange) then
				v:SetEnemy(self)
				v:Angery()
			end
		end
	end
	if e == "dragon_swaytaunt" then
		self.HeatC = math.min(300,self.HeatC - 50)
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsAlive() and v.CanAngry and self:IsInRange(v,self.RangeAttackRange) then
				v:SetEnemy(self)
				v:Angery()
			end
		end
	end
	if e == "rushtaunt" then
		self.HeatC = math.min(300,self.HeatC + 25)
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsAlive() and self.HeatC > 200 and v.CanAngry and self:IsInRange(v,self.MeleeAttackRange) then
				v:SetEnemy(self)
				v:Feare()
			end
		end
	end
	if e == "beasttaunt" then
		for k,v in pairs(ents.FindByClass("drg_scot_*")) do
			if v:IsAlive() and self.HeatC > 100 and v.CanAngry and self:IsInRange(v,self.RangeAttackRange) then
				v:SetEnemy(self)
				v:Feare()
			end
		end
	end
	if e == "counter" then
		if IsValid(self.Target) then
		self.Target:SetCollisionGroup(self.Boundcol)
		self:EmitSound("yakuza0/weapons/fists/dragon/fin12.wav")
		self.Target:TakeDamage(100, self, self)
		self.HeatC = math.min(300,self.HeatC + 100/2)
		end
	end
	if e == "spcrush" then
		if IsValid(self.Target) then
		self:EmitSound("yakuza0/weapons/fists/brawler/fin03_"..math.random(2)..".wav")
		self.Target:TakeDamage(150, self, self)
		end
	end
	if e == "nageattack" then
		if IsValid(self.Target) then
		self.HeatC = math.min(300,self.HeatC + 60)
		self.Target:TakeDamage(150, self, self)
		end
	end
	if e == "chyro" then
		if IsValid(self.Target) then
		self:EmitSound("common/bone3.wav",85)
		self.HeatC = math.min(300,self.HeatC - 150)
		self.Target:TakeDamage(250, self, self)
		end
	end
if e == "chyro" then
		if IsValid(self.Target) then
		self:EmitSound("common/bone3.wav",85)
		self.HeatC = math.min(300,self.HeatC - 100)
		self.Target:TakeDamage(125, self, self)
		end
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
	if e == "fist_bump" then
		self:EmitSound("kiryu/e_atk"..math.random(1,4)..".wav")
	end
	if e == "boner" then
		if IsValid(self.BoundTarget) then
		self.BoundTarget:EmitSound("common/bone3.wav")
		end
	end
	if e == "spattack" then
		if IsValid(self.BoundTarget) then
		self.BoundTarget:TakeDamage(125, self, self)
		end
	end
	if e == "dragon_parry" then
		if IsValid(self.Target) then
		self.Target:EmitSound("yakuzakiwami/bone3.wav")
		self.Target:TakeDamage(50, self, self)
		end
	end
	if e == "dragoninital" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_dragon/tukami.wav")
	end
	if e == "dragonjump" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_dragon/jump.wav")
	end
	if e == "dragonexknee" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_dragon/knee.wav")
	end
	if e == "dragonkiwami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_dragon/kiwami.wav")
	end
	if e == "dragonsandwich" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(250, self, self)
			else
			self.Target:TakeDamage(125, self, self)
			end
		end
	end
	if e == "dragonknee" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(750, self, self)
			else
			self.Target:TakeDamage(377.5, self, self)
			end
		end
	end
	if e == "rushpunch" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(40, self, self)
			else
			self.Target:TakeDamage(20, self, self)
			end
		end
	end
	if e == "rushuppercut" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(80, self, self)
			else
			self.Target:TakeDamage(40, self, self)
			end
		end
	end
	if e == "rushpunchfinal" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "brawlslap" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "brawlknee" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(125, self, self)
			else
			self.Target:TakeDamage(65, self, self)
			end
		end
	end
	if e == "brawlhammer" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "beastheadbutt" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "beaststomp" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuExtremeDamage")<=0 then
			self.Target:TakeDamage(300, self, self)
			else
			self.Target:TakeDamage(150, self, self)
			end
		end
	end
	if e == "beastexgrab" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_beast/asiate.wav")
	end
	if e == "beastexwoosh" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_beast/kamae_whoosh.wav")
	end
	if e == "beastexheadbutt" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_beast/zutuki.wav")
	end
	if e == "beastexfurnituke" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_beast/fumituke.wav")
	end
	if e == "beastkiwami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_beast/kiwami.wav")
	end
	if e == "brawlinital" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_brawler/uraken.wav")
	end
	if e == "brawlexknee" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_brawler/hizageri.wav")
	end
	if e == "brawlexhammer" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_brawler/last_punch.wav")
	end
	if e == "brawlkiwami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_brawler/kiwami.wav")
	end
	if e == "rushinitial" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_rush/punch_1.wav")
	end
	if e == "rushkiryuvoice" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_rush/kiryu_voice.wav")
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_rush/renda.wav")
	end
	if e == "rushlastpunch" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_rush/last_punch.wav")
	end
	if e == "rushkiwami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/extreme_rush/kiwami.wav")
	end
	if e == "crushswing" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_crush/enemyswing.wav")
	end
	if e == "crushhiji" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_crush/hiji_swing.wav")
	end
	if e == "crushcrunch" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_crush/hiji_hit.wav")
	end
	if e == "crushhit" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_crush/last_punch.wav")
	end
	if e == "slapbody" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/bodyfall.wav")
	end
	if e == "slapinitial" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/swing1.wav")
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/foot.wav")
	end
	if e == "slap1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/punch1.wav")
	end
	if e == "slaprenda" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/punch_renda.wav")
	end
	if e == "slapfinal" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/punch_final.wav")
	end
	if e == "slapfinalswing" then
		self:EmitSound("yakuzakiwami/kiryu/actions/dragon_slap/finalswing.wav")
	end
	if e == "tormentinitial" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/tukami.wav")
	end
	if e == "tormentvoiceangry" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/kiryu_angry.wav")
	end
	if e == "tormentbinta" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/kiryu_binta.wav")
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/binta.wav")
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTormentDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "tormentvoicebone" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/kiryu_bone.wav")
	end
	if e == "tormentbone" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/bone.wav")
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTormentDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "tormentbody" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/bodyfall.wav")
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTormentDamage")<=0 then
			self.Target:TakeDamage(125, self, self)
			else
			self.Target:TakeDamage(62.5, self, self)
			end
		end
	end
	if e == "tormentnage" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/nage.wav")
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_torment/kiryu_nage.wav")
	end
	if e == "getupdash" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/dash_1f.wav")
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/voice1.wav")
	end
	if e == "getupbody" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/down.wav")
	end
	if e == "getuphit" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/hit.wav")
	end
	if e == "getupvoice2" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/voice2.wav")
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuGetUpDamage")<=0 then
			self.Target:TakeDamage(300, self, self)
			else
			self.Target:TakeDamage(150, self, self)
			end
		end
	end
	if e == "getupjump" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_getup/jump.wav")
	end
	if e == "twist_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTwistDamage")<=0 then
			self.Target:TakeDamage(50, self, self)
			else
			self.Target:TakeDamage(25, self, self)
			end
		end
	end
	if e == "twist_dam2" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTwistDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "twist_dam3" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuTwistDamage")<=0 then
			self.Target:TakeDamage(30, self, self)
			else
			self.Target:TakeDamage(15, self, self)
			end
		end
	end
	if e == "twist_bone" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_twist/bone.wav",85)
	end
	if e == "twist_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_twist/keri.wav",85)
	end
	if e == "twist_last" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_twist/last.wav",85)
	end
	if e == "twist_tukami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_twist/tukami.wav",85)
	end
	if e == "finishblow_jump" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_finishblow/jump.wav",85)
	end
	if e == "finishblow_kiryu_down" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_finishblow/kiryu_down.wav",85)
	end
	if e == "finishblow_kiryu_voice" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_finishblow/kiryu_voice.wav",85)
	end
	if e == "finishblow_punch" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_finishblow/punch.wav",85)
	end
	if e == "finishblow_run_1f" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_finishblow/run_1f.wav",85)
	end
	if e == "finishblow_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuFinishDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "bwall_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBWallDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "bwall_dam2" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBWallDamage")<=0 then
			self.Target:TakeDamage(125, self, self)
			else
			self.Target:TakeDamage(62.5, self, self)
			end
		end
	end
	if e == "bwall_enemy_kick" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/enemy_kick.wav",85)
	end
	if e == "bwall_hizi" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/hizi.wav",85)
	end
	if e == "bwall_kick" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/kick.wav",85)
	end
	if e == "bwall_kiryu_voice_hizi" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/kiryu_voice_hizi.wav",85)
	end
	if e == "bwall_kiryu_voice_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/kiryu_voice_keri.wav",85)
	end
	if e == "bwall_throw" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_wall/throw.wav",85)
	end
	if e == "barrage_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self.Target:TakeDamage(50, self, self)
			else
			self.Target:TakeDamage(25, self, self)
			end
		end
	end
	if e == "barrage_dam2" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self.Target:TakeDamage(60, self, self)
			else
			self.Target:TakeDamage(30, self, self)
			end
		end
	end
	if e == "barrage_dam3" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self.Target:TakeDamage(70, self, self)
			else
			self.Target:TakeDamage(35, self, self)
			end
		end
	end
	if e == "barrage_dam4" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self.Target:TakeDamage(80, self, self)
			else
			self.Target:TakeDamage(40, self, self)
			end
		end
	end
	if e == "barrage_dam5" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuBarrageDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "barrage_kamae2" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/kamae2.wav",85)
	end
	if e == "barrage_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/keri.wav",85)
	end
	if e == "barrage_keri_effect" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/keri_effect.wav",85)
	end
	if e == "barrage_keri_fake" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/keri_fake.wav",85)
	end
	if e == "barrage_punch1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/punch1.wav",85)
	end
	if e == "barrage_punch2" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/punch2.wav",85)
	end
	if e == "barrage_punch3" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/punch3.wav",85)
	end
	if e == "barrage_punch4" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_barrage/punch4.wav",85)
	end
	if e == "rwall_enemy_kabe" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/enemy_kabe.wav",85)
	end
	if e == "rwall_hippari" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/hippari.wav",85)
	end
	if e == "rwall_kabedon" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/kabedon.wav",85)
	end
	if e == "rwall_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/keri.wav",85)
	end
	if e == "rwall_keri_effect" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/keri_effect.wav",85)
	end
	if e == "rwall_kiryu_voice_kawashi" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/kiryu_voice_kawashi.wav",85)
	end
	if e == "rwall_kiryu_voice_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/kiryu_voice_keri.wav",85)
	end
	if e == "rwall_kiryu_voice_nage" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/kiryu_voice_nage.wav",85)
	end
	if e == "rwall_throw" then
		self:EmitSound("yakuzakiwami/kiryu/actions/rush_wall/throw.wav",85)
	end
	if e == "rwall_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuCrushDamage")<=0 then
			self.Target:TakeDamage(60, self, self)
			else
			self.Target:TakeDamage(30, self, self)
			end
		end
	end
	if e == "rwall_dam2" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuCrushDamage")<=0 then
			self.Target:TakeDamage(70, self, self)
			else
			self.Target:TakeDamage(35, self, self)
			end
		end
	end
	if e == "rwall_dam3" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuCrushDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "bdownf_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDownDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "bdownf_effect1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downf/effect1.wav",85)
	end
	if e == "bdownf_punch" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downf/punch.wav",85)
	end
	if e == "bdownf_tukami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downf/tukami.wav",85)
	end
	if e == "bdownb_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDownDamage")<=0 then
			self.Target:TakeDamage(150, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "bdownb_foot" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downb/foot.wav",85)
	end
	if e == "bdownb_kick" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downb/kick.wav",85)
	end
	if e == "bdownb_kiryu_voice_kari" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downb/kiryu_voice_kari.wav",85)
	end
	if e == "bdownb_swing" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downb/swing.wav",85)
	end
	if e == "bdownb_tukami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/brawler_downb/tukami.wav",85)
	end
	if e == "downftramp_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDownDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "downftramp_kamikami" then
		self:EmitSound("yakuzakiwami/kiryu/actions/downf_trample/fumifumi.wav",85)
	end
	if e == "downbkickover_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDownDamage")<=0 then
			self.Target:TakeDamage(125, self, self)
			else
			self.Target:TakeDamage(75, self, self)
			end
		end
	end
	if e == "downbkickover_keri" then
		self:EmitSound("yakuzakiwami/kiryu/actions/downb_kickover/keri.wav",85)
	end
	if e == "mount_dam" then
		self:EmitSound("yakuzakiwami/kiryu/actions/mount/punch"..math.random(4)..".wav",85)
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDownDamage")<=0 then
			self.Target:TakeDamage(100, self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "overrun_add_01_ora_67f" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/add_01_ora_67f.wav",85)
	end
	if e == "overrun_03_start_cloth_m" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/03_start_cloth_m.wav",85)
	end
	if e == "overrun_step_m_run_02b" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/step_m_run_02b.wav",85)
	end
	if e == "overrun_step_m_run_03" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/step_m_run_03.wav",85)
	end
	if e == "overrun_step_m_run_04" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/step_m_run_04.wav",85)
	end
	if e == "overrun_05_hit1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/05_hit1.wav",85)
	end
	if e == "overrun_04_swish1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/04_swish1.wav",85)
	end
	if e == "overrun_08_hit2" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/08_hit2.wav",85)
	end
	if e == "overrun_07_swish2" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/07_swish2.wav",85)
	end
	if e == "overrun_add_02_hit_105f_137f" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/add_02_hit_105f_137f.wav",85)
	end
	if e == "overrun_e_06_cloth" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/e_06_cloth.wav",85)
	end
	if e == "overrun_e_step_m_02" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/e_step_m_02.wav",85)
	end
	if e == "overrun_add_03_hit_159f" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/add_03_hit_159f.wav",85)
	end
	if e == "overrun_10_hit3" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/10_hit3.wav",85)
	end
	if e == "overrun_09_swish3" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/09_swish3.wav",85)
	end
	if e == "overrun_11_throw1" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/11_throw1.wav",85)
	end
	if e == "overrun_12_catch_body" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/12_catch_body.wav",85)
	end
	if e == "overrun_13_swing" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/13_swing.wav",85)
	end
	if e == "overrun_e_14_finish_st" then
		self:EmitSound("yakuzakiwami/kiryu/actions/beast_overrun/e_14_finish_s5.wav",85)
	end
	if e == "overrun_dam4" then
		if IsValid(self.DTarget1) then
			if self:GetCooldown("KiryuOverrunDamage")<=0 then
			self.DTarget1:TakeDamage(200, self, self)
			else
			self.DTarget1:TakeDamage(100, self, self)
			end
		end
	end
	if e == "overrun_dam3" then
		if IsValid(self.DTarget2) then
			if self:GetCooldown("KiryuOverrunDamage")<=0 then
			self.DTarget2:TakeDamage(200, self, self)
			else
			self.DTarget2:TakeDamage(100, self, self)
			end
		end
	end
	if e == "overrun_dam2" then
		if IsValid(self.DTarget3) then
			if self:GetCooldown("KiryuOverrunDamage")<=0 then
			self.DTarget3:TakeDamage(200, self, self)
			else
			self.DTarget3:TakeDamage(100, self, self)
			end
		end
	end
	if e == "overrun_dam1" then
		if IsValid(self.DTarget4) then
			if self:GetCooldown("KiryuOverrunDamage")<=0 then
			self.DTarget4:TakeDamage(300, self, self)
			else
			self.DTarget4:TakeDamage(150, self, self)
			end
		end
	end
	if e == "nishiki_cam1_fov1" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(32.6+5,0,self)
		elseif self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(36+5,0,self)
		end
	end
	if e == "nishiki_cam1_fov2" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(36+5,0,self)
		end
	end
	if e == "nishiki_nagurikakari1" then
		self:EmitSound("kiryu/actions/nishiki/nagurikakari1.wav",85)
	end
	if e == "nishiki_kiryu_uke" then
		self:EmitSound("kiryu/actions/nishiki/kiryu_uke.wav",85)
	end
	if e == "nishiki_kizuki_nishiki" then
		self:EmitSound("kiryu/actions/nishiki/kizuki_nishiki.wav",85)
	end
	if e == "nishiki_nishiki_thanks" then
		if IsValid(self.Nishiki) then
		self.Nishiki:EmitSound("kiryu/actions/nishiki/nishiki_thanks.wav",85)
		end
	end
	if e == "nishiki_nishiki_naguri" then
		if IsValid(self.Nishiki) then
		self.Nishiki:EmitSound("kiryu/actions/nishiki/nishiki_naguri.wav",85)
		end
	end
	if e == "nishiki_nishiki_gangan" then
		if IsValid(self.Nishiki) then
		self.Nishiki:EmitSound("kiryu/actions/nishiki/nishiki_gangan.wav",85)
		end
	end
	if e == "nishiki_kiryu_haraipunch" then
		self:EmitSound("kiryu/actions/nishiki/kiryu_haraipunch.wav",85)
	end
	if e == "nishiki_last_punch" then
		self:EmitSound("kiryu/actions/nishiki/last_punch.wav",85)
	end
	if e == "nishiki_down" then
		self:EmitSound("kiryu/actions/nishiki/down.wav",85)
	end
	if e == "nishiki_dam" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDuoDamage")<=0 then
			self.Target:TakeDamage(200, self, self)
			else
			self.Target:TakeDamage(60, self, self)
			end
		end
	end
	if e == "disarm_cam1_fov1" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,1.1,self)
		end
	end
	if e == "disarm_cam1_fov2" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(23.1+5,0,self)
		end
	end
	if e == "disarm_cam1_fov3" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,0,self)
		self.Player:SetFOV(50.5+5,2,self)
		end
	end
	if e == "disarm_cam2_fov1" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(20.8+5,0.1,self)
		end
	end
	if e == "disarm_cam2_fov2" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,0.3,self)
		end
	end
	if e == "disarm_cam2_fov3" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(23.1+5,0,self)
		self.Player:SetFOV(17.1+5,0.8,self)
		end
	end
	if e == "disarm_cam2_fov4" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(36+5,0,self)
		self.Player:SetFOV(17+5,0.2,self)
		end
	end
	if e == "disarm_cam2_fov5" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(23.1+5,0.4,self)
		end
	end
	if e == "disarm_cam2_fov6" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(14.7+5,0.2,self)
		end
	end
	if e == "disarm_cam2_fov7" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(23.1+5,0.4,self)
		end
	end
	if e == "disarm_cam2_fov8" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,0,self)
		self.Player:SetFOV(50.5+5,2,self)
		end
	end
	if e == "disarm_cam3_fov1" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(17.1+5,0.4,self)
		end
	end
	if e == "disarm_cam3_fov2" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,1.2,self)
		end
	end
	if e == "disarm_cam3_fov3" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(17.1+5,0.1,self)
		end
	end
	if e == "disarm_cam3_fov4" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(29.4+5,0.86,self)
		end
	end
	if e == "disarm_cam3_fov5" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(13.9+5,0.1,self)
		end
	end
	if e == "disarm_cam3_fov6" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(50.5+5,3,self)
		end
	end
	if e == "disarm_down" then
		self:EmitSound("kiryu/actions/brawler_disarm/down.wav",85)
	end
	if e == "disarm_keri" then
		self:EmitSound("kiryu/actions/brawler_disarm/keri"..math.random(2)..".wav",85)
	end
	if e == "disarm_punch" then
		self:EmitSound("kiryu/actions/brawler_disarm/punch.wav",85)
	end
	if e == "disarm_tukami" then
		self:EmitSound("kiryu/actions/brawler_disarm/tukami.wav",85)
	end
	if e == "disarm_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDisarmDamage")<=0 then
			self.Target:TakeDamage(70, self, self)
			else
			self.Target:TakeDamage(35, self, self)
			end
		end
	end
	if e == "disarm_dam2" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDisarmDamage")<=0 then
			self.Target:TakeDamage(80, self, self)
			else
			self.Target:TakeDamage(40, self, self)
			end
		end
	end
	if e == "selfdestructh_dam1" then
		if IsValid(self.Target) then
			if self:GetCooldown("KiryuDestructDamage")<=0 and not self.Target.FWPC then
			self.Target:TakeDamage(40, self, self)
			elseif self.Target.FWPC then
			self.Target:TakeDamage(self.Target:Health()/2, self, self)
			else
			self.Target:TakeDamage(20, self, self)
			end
		end
	end
	if e == "selfdestructh_dam2" then
		if IsValid(self.Target) then
			self.Target:DropChair()
			self.Target.Chair:TakeDamage(self.Target.Chair:Health())
			if self:GetCooldown("KiryuDestructDamage")<=0 and not self.Target.FWPC then
			self.Target:TakeDamage(100, self, self)
			elseif self.Target.FWPC then
			self.Target:TakeDamage(self.Target:Health(), self, self)
			else
			self.Target:TakeDamage(50, self, self)
			end
		end
	end
	if e == "selfdestructh_cam1_fov1" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(21+5,0,self)
		self.Player:SetFOV(20.4+5,0.05,self)
		end
	end
	if e == "selfdestructh_cam1_fov2" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(52.9+5,0,self)
		end
	end
	if e == "selfdestructh_cam1_fov3" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(31.9+5,0,self)
		self.Player:SetFOV(54.4+5,1,self)
		end
	end
	if e == "selfdestructh_cam1_fov4" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(32.5+5,0.5,self)
		end
	end
	if e == "selfdestructh_cam1_fov5" then
		if self.Cam1 and IsValid(self.Player) then
		self.Player:SetFOV(49.7+5,0.3,self)
		end
	end
	if e == "selfdestructh_cam2_fov1" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(58.7+5,0,self)
		end
	end
	if e == "selfdestructh_cam2_fov2" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(41.1+5,0,self)
		end
	end
	if e == "selfdestructh_cam2_fov3" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(54.4+5,0,self)
		end
	end
	if e == "selfdestructh_cam2_fov4" then
		if self.Cam2 and IsValid(self.Player) then
		self.Player:SetFOV(43+5,0,self)
		end
	end
	if e == "selfdestructh_cam3_fov1" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(58.7+5,0,self)
		end
	end
	if e == "selfdestructh_cam3_fov2" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(41.1+5,0,self)
		end
	end
	if e == "selfdestructh_cam3_fov3" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(54.4+5,0,self)
		end
	end
	if e == "selfdestructh_cam3_fov4" then
		if self.Cam3 and IsValid(self.Player) then
		self.Player:SetFOV(43+5,0,self)
		end
	end
	if e == "selfdestruct_keri" then
		self:EmitSound("kiryu/actions/selfdestruct/keri.wav",85)
	end
	if e == "selfdestruct_kerijump" then
		self:EmitSound("kiryu/actions/selfdestruct/kerijump.wav",85)
	end
	if e == "selfdestruct_obj_hit" then
		if IsValid(self.Target) then
			self.Target:EmitSound("kiryu/actions/selfdestruct/obj_hit.wav",85)
		end
	end
	if e == "selfdestruct_down" then
		if IsValid(self.Target) then
			self.Target:EmitSound("kiryu/actions/selfdestruct/down.wav",85)
		end
	end
	if e == "attacks" then
		self:EmitSound("kiryu/attack_s"..math.random(4)..".wav",85)
	end
	if e == "attackl" then
		self:EmitSound("kiryu/attack_l"..math.random(3)..".wav",85)
	end
	if e == "attackxl" then
		self:EmitSound("kiryu/attack_xl"..math.random(3)..".wav",85)
	end
	if e == "pain" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/pain.wav",85)
	end
	if e == "painh" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/damage_head_s"..math.random(4)..".wav",85)
	end
	if e == "painb" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/damage_body_s"..math.random(4)..".wav",85)
	end
	if e == "painhl" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/damage_head_l"..math.random(4)..".wav",85)
	end
	if e == "painbl" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/damage_body_l"..math.random(4)..".wav",85)
	end
	if e == "painxl" then
		if (self:GetBodygroup(1) == 1) then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
		self:EmitSound("kiryu/damage_xl"..math.random(2)..".wav",85)
	end
	if e == "stand" then
		self:EmitSound("kiryu/stand"..math.random(2)..".wav",85)
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
	if e == "downf" then
		self:CICO(function()
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.WBProtection = false
		self.Flinching = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Back = false
		self.Front = true
		self:Extinguish()
		if self:IsDead() then
		self:PlaySequenceAndMove("down_f_death"..math.random(4),1)
		else
		if self.AutoStand or not self:IsPossessed() then
		self.DFlinches = 0
		self.AutoStand = false
		self:SetCooldown("DownFlinch",2)
		self:PlaySequenceAndMove("kiryu_standup_f",1)
		self.StandingUp = false
		else
		if self.HeadPain then
		self.HeadPain = false
		self:PlaySequenceAndMove("down_f_pain_head_st",1)
		elseif self.BodyPain then
		self.BodyPain = false
		self:PlaySequenceAndMove("down_f_pain_body_st",1)
		elseif self.LegPain then
		self.LegPain = false
		self:PlaySequenceAndMove("down_f_pain_leg_st",1)
		else
		self:PlaySequenceAndMove("down_f",1)
		end
		end
		end
		end)
	end
	if e == "downb" then
		self:CICO(function()
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.WBProtection = false
		self.Flinching = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Front = false
		self.Back = true
		self:Extinguish()
		if self:IsDead() then
		self:PlaySequenceAndMove("down_b_death"..math.random(4),1)
		else
		if self.AutoStand or not self:IsPossessed() then
		self.DFlinches = 0
		self.AutoStand = false
		self:SetCooldown("DownFlinch",2)
		self:PlaySequenceAndMove("kiryu_standup_b",1)
		self.StandingUp = false
		else
		if self.HeadPain then
		self.HeadPain = false
		self:PlaySequenceAndMove("down_b_pain_head_st",1)
		elseif self.BodyPain then
		self.BodyPain = false
		self:PlaySequenceAndMove("down_b_pain_body_st",1)
		elseif self.LegPain then
		self.LegPain = false
		self:PlaySequenceAndMove("down_b_pain_leg_st",1)
		else
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
	if e == "down_st" then
	self.Downing = true
	self:CICO(function()
		self.DownSafety2 = false
	end)
	end
	if e == "down_en" then
	self.Downing = false
	self.Downed = true
	end
	if e == "stand_st" then
	self.DownSafety = false
	self.Downed = false
	self.StandingUp = true
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
		d:SetAttacker( self.LastAttacker ) 
		d:SetDamageType( DMG_MISSILEDEFENSE ) 
		self:TakeDamageInfo( d )
		end)
	end
	if e == "downfatalflp" or e == "downfatalfst" then
		self:CICO(function()
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.WBProtection = false
		self.Flinching = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Front = false
		self.Back = true
		self:Extinguish()
		if self.AutoStand or not self:IsPossessed() then
		self.DFlinches = 0
		self.AutoStand = false
		self:SetCooldown("DownFlinch",2)
		self:PlaySequenceAndMove("down_fatal_f_en",1)
		if self:IsDead() then
		self:PlaySequenceAndMove("death"..math.random(5),1)
		end
		self.StandingUp = false
		else
		self:PlaySequenceAndMove("down_fatal_f_lp",1)
		end
		end)
	end
	if e == "downfatalblp" or e == "downfatalbst" then
		self:CICO(function()
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.WBProtection = false
		self.Flinching = false
		self.Downing = false
		self.Downed = true
		self.StandingUp = false
		self.HeatAction = false
		self.Front = true
		self.Back = false
		self:Extinguish()
		if self.AutoStand or not self:IsPossessed() then
		self.DFlinches = 0
		self.AutoStand = false
		self:SetCooldown("DownFlinch",2)
		self:PlaySequenceAndMove("down_fatal_b_en",1)
		if self:IsDead() then
		self:PlaySequenceAndMove("death"..math.random(5),1)
		end
		self.StandingUp = false
		else
		self:PlaySequenceAndMove("down_fatal_b_lp",1)
		end
		end)
	end
	if e == "bound1on" then
		self.BoundTarget.Collateral = true
		self.Bounding1 = true
	end
	if e == "bound1off" then
		self.Bounding1 = false
		self.BoundTarget:SetCollisionGroup(self.Boundcol)
		for k,v in pairs(ents.GetAll()) do
			if v.Collateral then
				v.Collateral = false
			end
		end
	end
	if e == "bound2on" then
		self.BoundTarget.Collateral = true
		self.Bounding2 = true
	end
	if e == "bound2off" then
		self.Bounding2 = false
		self.BoundTarget:SetCollisionGroup(self.Boundcol)
		for k,v in pairs(ents.GetAll()) do
			if v.Collateral then
				v.Collateral = false
			end
		end
	end
	if e == "bound3on" then
		self.BoundTarget.Collateral = true
		self.Bounding3 = true
	end
	if e == "bound3off" then
		self.Bounding3 = false
		self.BoundTarget:SetCollisionGroup(self.Boundcol)
		for k,v in pairs(ents.GetAll()) do
			if v.Collateral then
				v.Collateral = false
			end
		end
	end
	if e == "bound4on" then
		self.BoundTarget.Collateral = true
		self.Bounding4 = true
	end
	if e == "bound4off" then
		self.Bounding4 = false
		self.BoundTarget:SetCollisionGroup(self.Boundcol)
		for k,v in pairs(ents.GetAll()) do
			if v.Collateral then
				v.Collateral = false
			end
		end
	end
	if e == "cig_case" then
		self:SetBodygroup(2,1)
	end
	if e == "cig_cig" then
		self:SetBodygroup(1,2)
	end
	if e == "cig_caseoff" then
		self:SetBodygroup(2,0)
	end
	if e == "cig_light" then
		self.CigHelp = ents.Create("obj_yakuza_heat")
		self.CigHelp:SetModel("models/scot/yakuza0/ciggiee.mdl")
		self.CigHelp:Spawn()
		self.CigHelp:SetParent(self)
		self.CigHelp:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
		local CigLight = ents.Create("light_dynamic")
		CigLight:SetKeyValue("brightness", "0.1")
		CigLight:SetKeyValue("distance", "40")
		CigLight:SetKeyValue("style", "6")
		CigLight:SetLocalPos(self.CigHelp:GetPos())
		CigLight:SetLocalAngles(self.CigHelp:GetAngles())
		CigLight:Fire("Color", "70 26 0")
		CigLight:SetParent(self.CigHelp)
		CigLight:Spawn()
		CigLight:Activate()
		CigLight:Fire("TurnOn", "", 0)
		CigLight:Fire("setparentattachment","cig1")
		self:DeleteOnRemove(CigLight)
		self.lighte = CigLight
		ParticleEffectAttach("cig_burn",PATTACH_POINT_FOLLOW,self.CigHelp,2)
		ParticleEffectAttach("cig_smoke",PATTACH_POINT_FOLLOW,self.CigHelp,2)
	end
	if e == "cig_puff" then
		ParticleEffectAttach("cig_puff",PATTACH_POINT_FOLLOW,self,2)
		self:Timer(1,function()
		if IsValid(self) then
		self:StopParticles()
		end
		end)
	end
	if e == "cig_cigoff" then
		if self:GetBodygroup(1) == 2 then
		self:SetBodygroup(1,0)
			if IsValid(self.CigHelp) then
				self.CigHelp:Remove()
			end
		end
	end
	if e == "cig2_cig" then
		self:SetBodygroup(1,1)
	end
	if e == "cig2_light" then
		self.CigHelp = ents.Create("obj_yakuza_heat")
		self.CigHelp:SetModel("models/scot/yakuza0/ciggiee.mdl")
		self.CigHelp:Spawn()
		self.CigHelp:SetParent(self)
		self.CigHelp:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
		local CigLight = ents.Create("light_dynamic")
		CigLight:SetKeyValue("brightness", "0.1")
		CigLight:SetKeyValue("distance", "40")
		CigLight:SetKeyValue("style", "6")
		CigLight:SetLocalPos(self.CigHelp:GetPos())
		CigLight:SetLocalAngles(self.CigHelp:GetAngles())
		CigLight:Fire("Color", "70 26 0")
		CigLight:SetParent(self.CigHelp)
		CigLight:Spawn()
		CigLight:Activate()
		CigLight:Fire("TurnOn", "", 0)
		CigLight:Fire("setparentattachment","cig2")
		self:DeleteOnRemove(CigLight)
		self.lighte = CigLight
		ParticleEffectAttach("cig_burn",PATTACH_POINT_FOLLOW,self.CigHelp,3)
		ParticleEffectAttach("cig_smoke",PATTACH_POINT_FOLLOW,self.CigHelp,3)
	end
	if e == "door" then
		for k,door in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,75)), 30)) do
			if IsValid(door) and door:GetClass() == "prop_door_rotating" and door:GetInternalVariable( "m_eDoorState" ) == 0 and not door:GetInternalVariable( "m_bLocked" ) then
				self.Door = door
				self.Busting = true
				if self.Combat then
				door:EmitSound("doors/vent_open3.wav",511,math.random(50,80))
				door:Fire("setspeed",500)
				end
				door:Fire("openawayfrom",self:GetName())
				
				self:Timer(113/90,function()
					door:Fire("setspeed",100)
					self:Timer(0.2,function()
						self.Busting = false
						self.CanOpenDoor = true
						self.CanAttack = true
						self.Flinching = false
					end)
				end)
			end
		end
	end
	if e == "face_calm" then
		self:ResetFace()
		self.Calm = true
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
function ENT:OnOtherKilled(ent, dmg)
	local attacker = dmg:GetAttacker()
	if IsValid(attacker) and attacker == self then
		if (ent:GetModel() == "models/scot/yakuza0/akira_nishikiyama_kara.mdl") then
		if self.Step2 and self.Step1 and self.Step3 then
		self.Step4 = true
		else
		self.Step1 = false
		self.Step2 = false
		self.Step3 = false
		end
		end
		if (ent:GetModel() == "models/scot/yakuza0/osamu_kashiwagi.mdl") then
		if self.Step2 and self.Step1 and self.Step3 and not self.Judgement then
		self.Judgement = true
		else
		self.Step1 = false
		self.Step2 = false
		self.Step3 = false
		self.Step4 = false
		end
		end
		if ent:GetMaxHealth() > 1000 then
		self.ToughnessZ = math.min(5,self.ToughnessZ + 1)
		else
		if math.random(2)==1 then
		self.ToughnessZ = math.min(5,self.ToughnessZ + 1)
		end
		end
	end
end
function ENT:ShouldRun() 
	return self:HasEnemy() and not self:IsInRange(self:GetEnemy(),self.RangeAttackRange*1) 
end
function ENT:Yakuza_Melee(enemy)
	if self:GetCooldown("KiryuAttack")<=0 then
			self:SetCooldown("KiryuAttack",math.random(2.5,4))
	self.Attacking = true
	if self.Beast then
	self:EmitSound("kiryu/attack_s1.wav",85)
	self.Damage = 25
	self:PlaySequenceAndMove("beast_cmb01",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	end
	if self.Rush then
	local att = math.random(1,2)
	if att==1 then
	self:EmitSound("kiryu/attack_s1.wav",85)
	self.Damage = 10
	self:PlaySequenceAndMove("rush_cmb01",self.RushSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 35
	self:EmitSound("kiryu/attack_xl3.wav",85)
	self:PlaySequenceAndMove("rush_atk_sp",1)
	self.Attacking = false
	end
	elseif self.Dragon then
	local att = math.random(1,3)
	if att==1 then
	self.Damage = 30
	self:EmitSound("kiryu/attack_s3.wav",85)
	self:PlaySequenceAndMove("dragon_cmb01",self.DragonSpeed,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
	elseif att==2 then
	self.Damage = 35
	self:EmitSound("kiryu/attack_l3.wav",85)
	self:PlaySequenceAndMove("dragon_atk_heavy",self.Speed)
	self.Attacking = false
	elseif att==3 then
	self.Damage = 50
	self:PlaySequenceAndMove("dragon_atk_run",self.Speed)
	self.Attacking = false
	end
	end
	else 	

	local mdirection = math.random(4)
	if mdirection == 4 then
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
end
function ENT:Yakuza_Range(enemy)
	
	self:PlaySequenceAndMove("",1,function(self,cycle)
		if cycle < 0.25 then self:FaceEnemy() end
	end)
end
function ENT:Stance()
	if not self.Combat then
	if self.Rush then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop2 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop2 = CreateSound(game.GetWorld(),"kiryu/songs/touristtrap.wav", filter)
			self.ThemeSongLoop2:SetSoundLevel(0)
		end
		self.ThemeSongLoop2:Play()
		end
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		self:EmitSound("yakuza0/gage_heat.wav",511)
		ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
	self.IdleAnimation = "rush_shift_idle"
	self.WalkAnimation = "rush_shift"
	self.RunAnimation = "rush_run"
	elseif self.Beast then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop3 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop3 = CreateSound(game.GetWorld(),"kiryu/songs/yokohamatussle.wav", filter)
			self.ThemeSongLoop3:SetSoundLevel(0)
		end
		self.ThemeSongLoop3:Play()
		end
		if IsValid(self.HeatM) then
		self.HeatM:StopParticles()
		self:EmitSound("yakuza0/gage_heat.wav",511)
		ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
		end
	self.IdleAnimation = "beast_shift_idle"
	self.WalkAnimation = "beast_shift"
	self.RunAnimation = "beast_run"
	elseif self.Dragon then
		if GetConVarNumber("drg_yakuza6_kiryumusic") == 1 then
		if !self.ThemeSongLoop4 then 
			filter = RecipientFilter()
			filter:AddAllPlayers()
			self.ThemeSongLoop4 = CreateSound(game.GetWorld(),"kiryu/songs/kamuroagain.wav", filter)
			self.ThemeSongLoop4:SetSoundLevel(0)
		end
		self.ThemeSongLoop4:Play()
		end
		self:EmitSound("yakuza0/gage_heat.wav",511)
	self.IdleAnimation = "dragon_shift_idle"
	self.WalkAnimation = "dragon_shift"
	self.RunAnimation = "kiryu_run"
	end
	end
end
  function ENT:OnRangeAttack(enemy)
	if self.Combat == false then
	self.Combat = true
	self:FaceInstant(enemy)
	self:PlaySequenceAndMove("into_brawler",1)
	self.IdleAnimation = "brawler_shift_idle"
	self.WalkAnimation = "brawler_shift"
	self.RunAnimation = "dragonrun"
	end
	if self:GetCooldown("KiryuHeal")<=0 then
	if math.random(2) == 1 then
	self:SetCooldown("KiryuHeal", math.random(5,20))
	else
	self:SetCooldown("KiryuHeal", math.random(5,20))
	if self:Health() == self:GetMaxHealth() then return end
	if self.ToughnessZ > 0 and self:GetCooldown("Healy")<=0 then
	self:SetCooldown("Healy",1)
	self.ToughnessZ = math.min(5,self.ToughnessZ - 1)
	self:SetHealth(self:Health() + 500)
	if self:Health() > self:GetMaxHealth() then
	self:SetHealth(self:GetMaxHealth())
	end
	end
	end
	end
	if self:GetCooldown("KiryuStyleSwitch")<=0 then
	if math.random(2) == 1 then
	self:SetCooldown("KiryuStyleSwitch", math.random(5,20))
	else
	self:SetCooldown("KiryuStyleSwitch", math.random(5,20))
	local style = math.random(3)
	if style==1 then
	if self.Combat and not self.Rush then
	if IsValid(self.HeatM) then
	self.HeatM:StopParticles()
	ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
	end
	self:EmitSound("kiryu/kenka_st.wav",85)
		self:EmitSound("yakuza0/style.wav",511)
	self:PlaySequenceAndMove("into_rush",1)
	self.IdleAnimation = "rush_shift_idle"
	self.WalkAnimation = "rush_shift"
	self.RunAnimation = "rush_run"
	self.Dragon = false
	self.Rush = true
	self.Beast = false
	end
	elseif style==2 then
	if self.Combat and not self.Beast then
	if IsValid(self.HeatM) then
	self.HeatM:StopParticles()
	ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
	end
	self:EmitSound("kiryu/attack_s_st.wav",85)
		self:EmitSound("yakuza0/style.wav",511)
	self:PlaySequenceAndMove("into_beast",1)
	self.IdleAnimation = "beast_shift_idle"
	self.WalkAnimation = "beast_shift"
	self.RunAnimation = "beast_walk"
	self.Dragon = false
	self.Rush = false
	self.Beast = true
	end
	elseif style==3 then
	if self.Combat and not self.Dragon then
	self:EmitSound("kiryu/sake.wav",85)
	self:EmitSound("yakuza0/style.wav",511)
	self:PlaySequenceAndMove("dragonstyle",1)
	self.IdleAnimation = "dragon_shift_idle"
	self.WalkAnimation = "dragon_shift"
	self.RunAnimation = "kiryu_run"
	self.Dragon = true
	self.Rush = false
	self.Beast = false
	end
	end
	end
	end
	if self:GetCooldown("Yakuza_"..self:GetClass().."_Strafe") >0 then return end

	local mdirection = math.random(4)
	if mdirection == 4 then
		self:Yakuza_Range(enemy)
	else
		self:Yakuza_Strafe(enemy,mdirection)
	end
	self:SetCooldown("Yakuza_"..self:GetClass().."_Strafe", math.random(1,2))
end
function ENT:OnRemove()
	if IsValid(self.Player) then
		self.Player:Freeze(false)
		self.Player:SetNoDraw(false)
		self.Player:SetNoTarget(false)
		self.Player:SetViewEntity(ply)
	end
	if IsValid(self.Camera) then
		self.Camera:Remove()
	end
	if IsValid(self.Cam) then
		self.Cam:Remove()
	end
	if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
	end
	if self.ThemeSongLoop2 then 
		self.ThemeSongLoop2:Stop()
	end
	if self.ThemeSongLoop3 then 
		self.ThemeSongLoop3:Stop()
	end
	if self.ThemeSongLoop4 then 
		self.ThemeSongLoop4:Stop()
	end
	if self.ThemeSongLoop5 then 
		self.ThemeSongLoop5:Stop()
	end
	if self.ThemeSongLoop6 then 
		self.ThemeSongLoop6:Stop()
	end
	if self.ThemeSongLoop7 then 
		self.ThemeSongLoop7:Stop()
	end
	if self.ThemeSongLoop8 then 
		self.ThemeSongLoop8:Stop()
	end
end
function ENT:Yakuza_Strafe(enemy,mdirection)
	if mdirection == 1 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 2 then
		self:MoveLeft(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 3 then
		self:MoveRight(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
		elseif mdirection == 4 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	end
end
function ENT:OnDealtDamage(ent, dmg)
	if ent:IsNextBot() then
	if string.find(ent:GetClass(), "drg_scot_*") and ent:IsInFaction(FACTION_REBELS) and self:IsInFaction(FACTION_REBELS) and GetConVarNumber("drg_yakuza_ff") == 0 then
	dmg:SetDamage(0)
	end
	end
	if self.FinishBlower and dmg:GetDamage() > 0 and not ent.Downed then
		self:Timer(0.25,function()
		self.FinishBlowed = true
		self.Target = ent
		end)
		self:Timer(1,function()
		if IsValid(self) then
		self.FinishBlowed = false
		end
		end)
	end
	if self.Overrunning and dmg:GetDamage() > 0 then
		self:Timer(0.25,function()
		self.Overran = true
		self.Target = ent
		end)
		self:Timer(1,function()
		if IsValid(self) then
		self.Overran = false
		end
		end)
	end
	if self.Bear and dmg:GetDamage() > 0 and not ent.Downed and self.HeatC > 200 then
	self.Bear = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" then
	ent.Downed = true
	self.Downed = true
	ent.Attacking = false
	ent.Dodging = false
	self.Target = ent
	ent.HeatAction = true
	self.HeatAction = true
	ent.Tire = false
	self.Charging = false
	ent:StopParticles()
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self.Damage = 75
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:EmitSound("kiryu/throw.wav",85)
		self:PlaySequenceAndMove("beast_guard_counter_f_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("beast_guard_counter_f_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
	end
	end
	if self.Sp and dmg:GetDamage() > 0 and not ent.Downed then
	self.Sp = false
	if ent.Category == "Yakuza Kiwami" or ent.Category == "Yakuza 0" or ent.Category == "Yakuza Kiwami 5" or ent.Category == "Yakuza Kiwami 3" or ent.Category == "Yakuza Ishin!" then
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
		self.Damage = 75
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:EmitSound("kiryu/throw.wav",85)
		self:PlaySequenceAndMove("beast_kaihi_nage_f_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("beast_kaihi_nage_f_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		local col = self:GetCollisionGroup()
		self.Damage = 75
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self:EmitSound("kiryu/throw.wav",85)
		self:PlaySequenceAndMove("beast_kaihi_nage_b_sync")
		self.HeatAction = false
		self.Downed = false
		self:SetCollisionGroup(col)
		end)
		ent:CICO(function(ent)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		local ecol = ent:GetCollisionGroup()
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:PlaySequenceAndMove("beast_kaihi_nage_b_sync1")
		ent:SetCollisionGroup(ecol)
		ent.HeatAction = false
		ent.Downed = false
		end)
		end
	end
	end
	if string.find(ent:GetClass(), "prop_*") and not string.find(ent:GetClass(), "prop_physics") then
	self.HeatC = math.min(300,self.HeatC - dmg:GetDamage()/2)
	end
	if string.find(ent:GetClass(), "prop_physics") then
	local phys = ent:GetPhysicsObject()
	if phys:GetMass() < 300 then
	ent:SetOwner(self)
	phys:SetVelocity( self:GetForward() * 400 + self:GetUp() * 200 )
	end
	self.HeatC = math.min(300,self.HeatC - dmg:GetDamage()/2)
	end
	if ent.Dodge and not ent.Attacking then
	self.HeatC = math.min(300,self.HeatC - dmg:GetDamage()/2)
	end
	if not self.HeatAction and not self.TigerDrop then
	self.HeatC = math.min(300,self.HeatC + dmg:GetDamage()/2)
	end
	if ent:IsNextBot() and not ent.Dodge and not ent.HeatAction and not ent.Guarding and not ent.Blocking and dmg:GetDamage() > 0 then
	if self.Fin1 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb01_fin" then
		self:Timer(0.1,function()
		self.Boundr1 = true
		end)
		self.BoundTarget = ent
		self:Timer(0.55,function()
		self.Boundr1 = false
		end)
	elseif self.Fin2 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb02_fin" then
		self:Timer(0.1,function()
		self.Boundr2 = true
		end)
		self.BoundTarget = ent
		self:Timer(0.55,function()
		self.Boundr2 = false
		end)
	elseif self.Fin3 and (self:GetSequenceName(self:GetSequence()) == "dragon_cmb03_fin" or self:GetSequenceName(self:GetSequence()) == "brawler_cmb03_fin") then
		self:Timer(0.1,function()
		self.Boundr3 = true
		end)
		self.BoundTarget = ent
		self:Timer(0.55,function()
		self.Boundr3 = false
		end)
	elseif self.Fin4 and self:GetSequenceName(self:GetSequence()) == "dragon_cmb04_fin" then
		self:Timer(0.1,function()
		self.Boundr4 = true
		end)
		self.BoundTarget = ent
		self:Timer(0.55,function()
		self.Boundr4 = false
		end)
	end
	end
end
function ENT:OnTakeDamage(dmg)
	if self.HeatAction and not dmg:GetAttacker().HeatAction or self.TigerDrop then
	dmg:SetDamage(0)
	dmg:SetDamageType(DMG_DISSOLVE)
	end
   if self:IsDead() then return end
   if self.Invincible then
   dmg:SetDamage(0)
   dmg:SetDamageType(DMG_DISSOLVE)
   if dmg:GetAttacker().Category == "Yakuza Kiwami" or dmg:GetAttacker().Category == "Yakuza 0" or dmg:GetAttacker().Category == "Yakuza Kiwami 5" or dmg:GetAttacker().Category == "Yakuza Kiwami 3" then
	local ent = dmg:GetAttacker()
  	ent:CICO(function(ent)
	ent.Attacking = false
	ent:EmitSound("yakuza0/weapons/fists/guard_break.wav",85)
	ent:PlaySequenceAndMove("guard_break")
	end)
   end
   end
	if not self.Downed and self.Gowan and not self.Invincible then
		dmg:ScaleDamage(0.25)
		self.Target = dmg:GetInflictor()
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		if fwd:DistToSqr(pos) < bck:DistToSqr(pos) then
		self:CICO(function(self)
		if self.HeatC > 200 then
		self.Torment = true
		end
		self:PlaySequenceAndMove("beast_guard_hit_f",1)
		self.Torment = false
		end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) then
		self:CICO(function(self)
		if self.HeatC > 200 then
		self.Torment = true
		end
		self:PlaySequenceAndMove("beast_guard_hit_b",1)
		self.Torment = false
		end)
		end
	end
	if not self.Downed and not self.Downing and self.Blocking and not dmg:IsDamageType(DMG_BLAST) and not dmg:IsDamageType(DMG_DIRECT) and not dmg:IsDamageType(DMG_SLASH) and not dmg:IsBulletDamage() then
		if self.Beast then
		dmg:ScaleDamage(0.2)
		else
		self.GuardHP = math.min(200,self.GuardHP - dmg:GetDamage())
			if IsValid(dmg:GetAttacker()) then
				self:FaceInstant(dmg:GetAttacker():GetPos())
			else
				self:FaceInstant(dmg:GetReportedPosition())
			end
		end
			if self.GuardHP > 1 then
				if self.HeatC < 100 then
				self.HeatC = math.min(100,self.HeatC + dmg:GetDamage())
				end
		self:CICO(function(self)
		self:EmitSound("yakuza0/weapons/fists/guard"..math.random(2)..".wav",85)
				if self.Rush then
				self:PlaySequenceAndMove("rush_guard_hit",1)
				elseif self.Dragon then
				self:PlaySequenceAndMove("dragon_guard_hit",1)
				end
		end)
			else
		self:CICO(function(self)
			self.Blocking = false
			self.Flinching = true
			self:EmitSound("yakuza0/weapons/fists/guard_break.wav",85)
			self:PlaySequenceAndMove("guard_break",1)
			self.Flinching = false
		end)
			end
		dmg:ScaleDamage(0)
	end
   if not dmg:IsDamageType(DMG_BLAST) and not dmg:IsDamageType(DMG_DIRECT) and self.Downed != true and self.Dodge == true and self.Attacking == false then
   dmg:SetDamage(0)
   if not self:IsPossessed() then
	if self:GetCooldown("KiryuDodgeAnim")<=0 then
		self:SetCooldown("KiryuDodgeAnim",0.3)
   self:CICO(function()
		local sway = math.random(1,3)
		if sway==1 then
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Beast then
		self:PlaySequenceAndMove("beast_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:PlaySequenceAndMove("rush_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:PlaySequenceAndMove("dragon_sway_l",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		self:SetCooldown("KiryuAttack",0)
		elseif sway==2 then
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Beast then
		self:PlaySequenceAndMove("beast_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:PlaySequenceAndMove("rush_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:PlaySequenceAndMove("dragon_sway_r",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		self:SetCooldown("KiryuAttack",0)
		elseif sway==3 then
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		if self.Beast then
		self:PlaySequenceAndMove("beast_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Rush then
		self:PlaySequenceAndMove("rush_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		elseif self.Dragon then
		self:PlaySequenceAndMove("dragon_sway_b",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		end
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		self:SetCooldown("KiryuAttack",0)
		end
   end)
	end
   end
   end
	if not (self.Beast and self.Heat or self.Gowan) then
		if not self.Downed and (dmg:IsDamageType(DMG_FALL) or (self.Downing and (dmg:GetDamageType() == 0 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin) or dmg:GetDamageType() == 128)) or (self.StandingUp and not (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 4 or dmg:GetDamageType() == 32 or dmg:GetDamageType() == 128))) and not self.CantFall and not self.HeatAction and not dmg:IsDamageType(DMG_BURN) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 11 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(12,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f",1)
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
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
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
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 11 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(12,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f3",1)
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
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 11 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(12,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl1_f2",1)
				end
				else
				self:PlaySequenceAndMove("down_standup_r",1)
				end
			end)
			end
		elseif not self.Downed and dmg:IsBulletDamage() and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
			self.DownSafety2 = true
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
				self:PlaySequenceAndMove("down_explodragonf",1)
				self:AttackReset()
			end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
		and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				self:PlaySequenceAndMove("down_explodragonb",1)
				self:AttackReset()
			end)
		elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
		and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				self:PlaySequenceAndMove("down_explodragonl",1)
				self:AttackReset()
			end)
		elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
		and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				self:PlaySequenceAndMove("down_explodragonr",1)
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_CRUSH) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				 self.DownSafety2 = false
				 if IsValid(self.StunFX) then
					 self.StunFX:Remove()
				 end
				 self:Timer(0.1,function()
					 self.StunFX = ents.Create("obj_yakuza_heat")
					 self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
					 self.StunFX:Spawn()
					 self.StunFX:SetParent(self)
					 self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
					 ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				 end)
				 self:PlaySequenceAndMove("piyori_head_f_st",1)
				 self.Stunned = false
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				 self.DownSafety2 = false
				 if IsValid(self.StunFX) then
					 self.StunFX:Remove()
				 end
				 self:Timer(0.1,function()
					 self.StunFX = ents.Create("obj_yakuza_heat")
					 self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
					 self.StunFX:Spawn()
					 self.StunFX:SetParent(self)
					 self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
					 ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				 end)
				 self:PlaySequenceAndMove("piyori_head_b_st",1)
				 self.Stunned = false
				else
				self:PlaySequenceAndMove("down_push_b",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_BLAST_SURFACE) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_turn"..math.random(2),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
				end
				else
				self:PlaySequenceAndMove("down_body_b",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_VEHICLE) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self:PlaySequenceAndMove("down_heavy_b",1)
				end
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_SLASH) and dmg:GetInflictor().Fin and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_slash_hi_f"..math.random(2),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_slash_hi_b"..math.random(2),1)
				end
				else
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
			self.DownSafety2 = true
			self:AttackReset()
			local pos = dmg:GetDamagePosition()
			local dmer = dmg:GetInflictor()
			self:CICO(function(self)
				self.DownSafety = false
				if dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_slash_hi_f"..math.random(2),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_slash_hi_b"..math.random(2),1)
				end
				else
				self:PlaySequenceAndMove("down_back_b",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_PREVENT_PHYSICS_FORCE) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				 self.DownSafety2 = false
				 self.Stunned = true
				 if IsValid(self.StunFX) then
					 self.StunFX:Remove()
				 end
				 self:Timer(0.1,function()
					 self.StunFX = ents.Create("obj_yakuza_heat")
					 self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
					 self.StunFX:Spawn()
					 self.StunFX:SetParent(self)
					 self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
					 ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				 end)
				 self:PlaySequenceAndMove("piyori_head_f_st",1)
				 self.Stunned = false
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
				 self.DownSafety2 = false
				 if IsValid(self.StunFX) then
					 self.StunFX:Remove()
				 end
				 self:Timer(0.1,function()
					 self.StunFX = ents.Create("obj_yakuza_heat")
					 self.StunFX:SetModel("models/scot/yakuza0/share2.mdl")
					 self.StunFX:Spawn()
					 self.StunFX:SetParent(self)
					 self.StunFX:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
					 ParticleEffectAttach("yakuza_stunned",PATTACH_POINT_FOLLOW,self.StunFX,1)
				 end)
				 self:PlaySequenceAndMove("piyori_head_b_st",1)
				 self.Stunned = false
				else
				self:PlaySequenceAndMove("flinch_gut_brk_b",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_ALWAYSGIB) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_upr_head_f",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
				end
				else
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
			self.DownSafety2 = true
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
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self:PlaySequenceAndMove("down_leg_f",1)
				end
				self:AttackReset()
			end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
		and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self:PlaySequenceAndMove("down_leg_b",1)
				end
				self:AttackReset()
			end)
		elseif lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and lft:DistToSqr(pos) < bck:DistToSqr(pos) 
		and lft:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self:PlaySequenceAndMove("down_leg_l",1)
				end
				self:AttackReset()
			end)
		elseif rit:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and rit:DistToSqr(pos) < lft:DistToSqr(pos) 
		and rit:DistToSqr(pos) < bck:DistToSqr(pos) then
			self:CICO(function(self)
				self.DownSafety = false
				if self.Heat or dmer.NoDown or self.CantDowned then
				self.Downed = false
				self.Downing = false
				self.Cmb01 = true
				self.DownSafety2 = false
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
				self:PlaySequenceAndMove("down_leg_r",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_AIRBOAT) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
				self:PlaySequenceAndMove("down_head_r",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_NEVERGIB) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_b",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_head_lvl2_f"..math.random(3),1)
				end
				else
				self:PlaySequenceAndMove("down_direct_r",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and dmg:IsDamageType(DMG_PHYSGUN) and not self.Dodge and not self.Blocking and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_body_lvl2_b",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
				end
				else
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
				self.Cmb01 = true
				self.DownSafety2 = false
				if self:GetCooldown("Flinch")<=0 then
				if self.Flinches == 10 then
				self.Flinches = 0
				self:SetCooldown("Flinch",math.random(8,13))
				end
				self.Flinches = math.min(11,self.Flinches + 1)
				self:PlaySequenceAndMove("flinch_body_lvl2_f",1)
				end
				else
				self:PlaySequenceAndMove("down_body_r",1)
				end
				self:AttackReset()
			end)
			end
		elseif not self.Downed and not self.StandingUp and not self.Downing and dmg:IsDamageType(DMG_BURN) and not self.DownSafety then
			self.DownSafety = true
			self.DownSafety2 = true
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
				self.Cmb01 = true
				self.DownSafety2 = false
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
			self.DownSafety2 = true
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
			self.AutoStand = true
			self.Flinching = true
			self:StopParticles()
			self.Attacking = false
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
			self.AutoStand = true
			self.Flinching = true
			self:StopParticles()
			self.Attacking = false
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
			self.AutoStand = true
			self.Flinching = true
			self:StopParticles()
			self.Attacking = false
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
			self.AutoStand = true
			self.Flinching = true
			self:StopParticles()
			self.Attacking = false
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
	if not self.Beast and not self.TigerDrop and self:GetCooldown("Flinch")<=0 and (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 128 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin)) and not self.Downed and not self.Downing and not self.StandingUp and self.Flinches != 7 and self.Dodge != true and dmg:GetDamage() > 5 then
		if self.Flinches == 6 then
		self.Flinches = 0
		self:SetCooldown("Flinch",math.random(8,13))
		end
		self.Flinches = math.min(7,self.Flinches + 1)
		local fwd = self:GetPos()+self:GetForward()*1
		local bck = self:GetPos()-self:GetForward()*1
		local pos = dmg:GetDamagePosition()
		local dmer = dmg:GetDamage()
		local dmt = dmg:GetDamageType()
		self.Flinching = true
		self:AttackReset()
		self:CICO(function()
		self.Cmb01 = true
		self:StopParticles()
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
		self.Flinches = math.min(7,self.Flinches - 1)
		end
		if dmt == 4 then
		self:PlaySequenceAndMove("flinch_slash_mid_b",1)
		else
		self:PlaySequenceAndMove("flinch_head_lvl1_b",1)
		end
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) and dmer > 25 then
		if not self.Heat then
		self.Flinches = math.min(7,self.Flinches - 1)
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
	if not self.Gowan then
	self.HeatC = math.min(300,self.HeatC - dmg:GetDamage())
	end
	self.Test = dmg:GetDamage()
	self.LastAttacker = dmg:GetAttacker()
end
function ENT:AttackReset()
		self.Cmb01 = true
		self.Cmb02 = false
		self.Cmb02f = false
		self.Cmb03 = false
		self.Cmb03f = false
		self.Cmb04 = false
		self.Cmb04f = false
		self.Cmb05 = false
		self.Cmb05f = false
		self.Cmb06 = false
		self.Cmb07 = false
		self.Cmb08 = false
		self.Cmb09 = false
		self.Cmb09f = false
		self.Attacking = false
end
function ENT:OnDeath(dmg)
	self.HeatPos = self:GetPos()
	self.HeatAng = self:GetAngles()
	self.HeatAction = false
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self:SetCollisionBounds(Vector(-10,-10,0),Vector(10,10,10))
	if self.ThemeSongLoop then 
		self.ThemeSongLoop:FadeOut(4)
	end
	if self.ThemeSongLoop2 then 
		self.ThemeSongLoop2:FadeOut(4)
	end
	if self.ThemeSongLoop3 then 
		self.ThemeSongLoop3:FadeOut(4)
	end
	if self.ThemeSongLoop4 then 
		self.ThemeSongLoop4:FadeOut(4)
	end
	if self.ThemeSongLoop5 then 
		self.ThemeSongLoop5:FadeOut(4)
	end
	if self.ThemeSongLoop6 then 
		self.ThemeSongLoop6:FadeOut(4)
	end
	if self.ThemeSongLoop7 then 
		self.ThemeSongLoop7:FadeOut(4)
	end
	if self.ThemeSongLoop8 then 
		self.ThemeSongLoop8:FadeOut(4)
	end
	if IsValid(self.HeatM) then
	self.HeatM:Remove()
	end
	self:EmitSound("kiryu/dead"..math.random(4)..".wav",85)
	if dmg:GetAttacker().HeatAction then
	local cyc = self:GetCycle()
	self:Timer(0.02,function()
	self:SetPos(self.HeatPos)
	self:SetAngles(self.HeatAng)
	end)
	self:PlaySequenceAndMove(self:GetSequence(),1,function(self,cycle)if cycle < cyc then self:SetCycle(cyc) self:SetPos(self.HeatPos) self:SetAngles(self.HeatAng) end end)
	elseif not (dmg:GetDamageType() == 0 or dmg:GetDamageType() == 128 or (dmg:GetDamageType() == 4 and not dmg:GetInflictor().Fin)) then
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
	else
	self:PlaySequenceAndMove("death"..math.random(5),1)
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
	if not self.HeatAction then
		if self.Combat and not self.Attacking and not (self.Flinching or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Angry then
			self:ResetFace()
			end
			self.Angry = true
		elseif self.Attacking and not (self.Flinching or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Angry2 then
			self:ResetFace()
			end
			self.Angry2 = true
		elseif not self.Combat and not self.Attacking and not (self.Flinching or self:IsDead() or self.Downing or self.Downed or self.Stunned) then
			if not self.Calm then
			self:ResetFace()
			end
			self.Calm = false
		elseif self.Flinching or self:IsDead() or self.Downing or self.Downed or self.Stunned then
			if not self.Pain then
			self:ResetFace()
			end
			self.Pain = true
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
	if not self.Faceless then
	self:AddGestureSequence(self:LookupSequence("faces"),1)
	elseif self.Faceless then
	self:RemoveAllGestures()
	end
	if IsValid(self.StunFX) then
		if not (self:GetSequenceName(self:GetSequence()) == "piyori_head_b_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_lp" or self:GetSequenceName(self:GetSequence()) == "piyori_head_b_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_st" or self:GetSequenceName(self:GetSequence()) == "piyori_head_f_lp") then
			self.StunFX:Remove()
			self.Stunned = false
		end
	end
	if self:IsDead() then return end
	if self.Downing and not self.WBSafety and not (self:GetSequenceName(self:GetSequence()) == "down_wall_bound_f" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_b" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_f" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_b" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_f" or self:GetSequenceName(self:GetSequence()) == "down_wall_bound_b") then
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
		self:PlaySequenceAndMove("down_wall_bound_f")
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
	if self:IsPossessed() and self:IsRunning() and not self.Combat then
		if self:GetPossessor():KeyDown(IN_USE) then
			if not self.Dashing then
				self.Dashing = true
				self:GetPossessor():SetFOV(90,0.5,self)
				self:EmitSound("kiryu/dash_nrm.wav",85)
			end
			if self.Stamina < 26 then
				if self:GetPossessor():GetFOV() == 90 then
				self:GetPossessor():SetFOV(85,0.5,self)
				self:StopSound("kiryu/dash_nrm.wav")
				self:EmitSound("kiryu/dash_tired.wav",85)
				end
				self.RunAnimation = "run_dash_tired"
			else
				self.RunAnimation = "run_dash"
			end
		else
			if self.Dashing then
				self:StopSound("kiryu/dash_nrm.wav")
				self:StopSound("kiryu/dash_tired.wav")
				self.Dashing = false
				self:GetPossessor():SetFOV(0,0.5,self)
			end
			self.RunAnimation = "kiryu_run"
		end
		else
		if self.Dashing then
			self.Dashing = false
			if self:IsPossessed() then
			self:GetPossessor():SetFOV(0,0.5,self)
			end
		end
	end
	if self:IsRunning() and self.Dashing then
		self.Stamina = math.min(100,self.Stamina - 0.25)
	else
		self:StopSound("kiryu/dash_nrm.wav")
		self:StopSound("kiryu/dash_tired.wav")
		self.Stamina = math.min(100,self.Stamina + 0.25)
	end
	if self.Stamina < 0 and self.Dashing and self:IsRunning() and not self.RSafety and (self:GetSequenceName(self:GetSequence()) == "run_dash_tired") then
		self.Stamina = 0
		self.RSafety = true
		self:CICO(function(self)
			self.RSafety = false
			self:StopSound("kiryu/dash_nrm.wav")
			self:StopSound("kiryu/dash_tired.wav")
			self:EmitSound("kiryu/dash_end"..math.random(2)..".wav",85)
			self:PlaySequenceAndMove("run_dash_tired_stop_l",1,function(self,cycle)if cycle < 0.25 then self:PossessionFaceForward() end end)
			self.Stamina = 100
		end)
	end
	if self:IsPossessed() and not self.CantLoop then
	if self:GetPossessor():KeyDown(IN_RELOAD) and self:GetSequenceName(self:GetSequence()) == "dragon_sway_b" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Dodge = false
			self:PlaySequenceAndMove("dragon_sway_b_taunt",1)
			self.CantLoop = false
		end)
	elseif self:GetPossessor():KeyDown(IN_RELOAD) and self:GetSequenceName(self:GetSequence()) == "dragon_sway_f" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Dodge = false
			self:PlaySequenceAndMove("dragon_sway_f_taunt",1)
			self.CantLoop = false
		end)
	elseif self:GetPossessor():KeyDown(IN_RELOAD) and self:GetSequenceName(self:GetSequence()) == "dragon_sway_r" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Dodge = false
			self:PlaySequenceAndMove("dragon_sway_r_taunt",1)
			self.CantLoop = false
		end)
	elseif self:GetPossessor():KeyDown(IN_RELOAD) and self:GetSequenceName(self:GetSequence()) == "dragon_sway_l" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Dodge = false
			self:PlaySequenceAndMove("dragon_sway_l_taunt",1)
			self.CantLoop = false
		end)
	elseif not self:GetPossessor():KeyDown(IN_ATTACK2) and self:GetSequenceName(self:GetSequence()) == "brawler_atk_tame_st" then
		self.CantLoop = true
		self:CICO(function(self)
			self:StopSound("yakuza0/tame.wav",85)
			if IsValid(self:PossessionGetLockedOn()) then
			self.Damage = 25
			self.SetupType = DMG_GENERIC
			self:EmitSound("kiryu/attack_s1.wav",85)
			self:PlaySequenceAndMove("brawler_atk_heavy",1)
			else
			self.Damage = 35
			self.SetupType = DMG_GENERIC
			self:EmitSound("kiryu/attack_l1.wav",85)
			self:PlaySequenceAndMove("brawler_atk_kick",1)
			self.Cmb02 = false
			end
			self.CantLoop = false
		end)
	elseif not self:GetPossessor():KeyDown(IN_ATTACK2) and self:GetSequenceName(self:GetSequence()) == "brawler_atk_tame_lp" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Fin4 = true
			self.Damage = 50
			self:EmitSound("kiryu/special04.wav",85)
			self.SetupType = DMG_FALL
			self:PlaySequenceAndMove("brawler_atk_tame_en",1,function(self,cycle)if cycle < 0.2 then self:PossessionFaceForward() end end)
			self.Fin4 = false
			self.CantLoop = false
		end)
	elseif not self:GetPossessor():KeyDown(IN_ATTACK2) and self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_st" then
		self.CantLoop = true
		self:CICO(function(self)
			self:StopSound("yakuza0/tame.wav",85)
			self.Damage = 40
			self.SetupType = DMG_GENERIC
			self:EmitSound("kiryu/attack_xl2.wav",85)
			self:PlaySequenceAndMove("beast_atk_tackle",1)
			self.CantLoop = false
		end)
	elseif not self:GetPossessor():KeyDown(IN_ATTACK2) and self:GetSequenceName(self:GetSequence()) == "beast_atk_tame_tackle_lp" then
		self.CantLoop = true
		self:CICO(function(self)
			self.Fin3 = true
			self.Damage = 75
			self:EmitSound("kiryu/throw.wav",85)
			self.SetupType = DMG_VEHICLE
			self:PlaySequenceAndMove("beast_atk_tame_tackle_en",1,function(self,cycle)if cycle < 0.2 then self:PossessionFaceForward() end end)
			self.Fin3 = false
			self.CantLoop = false
		end)
	end
	end
	if not self:IsRunning() and (self.RunAnimation == "beast_run") then
	self.BuildUp = 0
	self.RunAnimation = "beast_walk"
	end
	if self:IsMoving() then
	if !game.SinglePlayer() then
	if self.Beast then
	self:SetAcceleration(70)
	self:SetDeceleration(70)
	self:SetMaxYawRate(110)
	else
	if self.Combat then
	self:SetAcceleration(self:GetSequenceGroundSpeed(self:GetSequence())*5)
	self:SetDeceleration(self:GetSequenceGroundSpeed(self:GetSequence())*5)
	self:SetMaxYawRate(600)
	else
	self:SetAcceleration(700)
	self:SetDeceleration(1)
	if self:GetSequenceName(self:GetSequence()) == "run_dash_tired_stop_l" then
		self:SetMaxYawRate(60)
	else
		self:SetMaxYawRate(200)
	end
	end
	end
	else
	if self.Beast and self.Combat then
	self:SetAcceleration(70)
	self:SetDeceleration(70)
	self:SetMaxYawRate(110)
	else
	if self.Combat then
	self:SetAcceleration(self:GetSequenceGroundSpeed(self:GetSequence())*10)
	self:SetDeceleration(self:GetSequenceGroundSpeed(self:GetSequence())*10)
	self:SetMaxYawRate(600)
	else
	self:SetAcceleration(700)
	self:SetDeceleration(1)
	if self:GetSequenceName(self:GetSequence()) == "run_dash_tired_stop_l" then
		self:SetMaxYawRate(60)
	else
		self:SetMaxYawRate(200)
	end
	end
	end
	end
	else
	self:SetAcceleration(1000)
	self:SetDeceleration(1000)
	end
	if self:GetCooldown("Invincible")<=0 then
	self.Invincible = false
	else
	self.Invincible = true
	end
	self:SetHeatB(self.HeatC)
	self:SetHealCount(self.ToughnessZ)
	self:SetStyleCheck(self.Style)
	if self:GetCooldown("KiryuDodge")<=0 and self.Dodge == true and not self:IsPossessed() then
	self.Dodge = false
	end
	if self.HeatC > 200 then
	self.DragonSpeed = 1.2
	else
	self.DragonSpeed = 0.85
	end
	if self.HeatC > 100 and not self.Heat then
	self.Heat = true
	if self.Combat then
	self:EmitSound("yakuza0/gage_heat.wav",511)
	end
	self.HeatM = ents.Create("obj_yakuza_heat")
	self.HeatM:SetModel("models/scot/yakuza0/heat.mdl")
	self.HeatM:Spawn()
	self.HeatM:SetParent(self)
	self.HeatM:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
	if self.Beast and self.Combat then
	ParticleEffectAttach("beast_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
	elseif self.Rush and self.Combat then
	ParticleEffectAttach("dragon_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
	elseif self.Dragon and self.Combat then
	ParticleEffectAttach("brawler_heat",PATTACH_POINT_FOLLOW,self.HeatM,0)
	end
	self.RushSpeed = 1.2
	end
	if self.HeatC < 100 then
	self.Heat = false
	if IsValid(self.HeatM) then
	if self.Combat then
	self:EmitSound("yakuza0/gage_down.wav",511)
	end
	self.HeatM:Remove()
	end
	self.RushSpeed = 1
	end
	if self.HeatC < 0 then
	self.HeatC = 0
	end
	if self.HeatC > 300 then
	self.HeatC = 300
	end
	if self.ToughnessZ < 0 then
	self.ToughnessZ = 0
	end
	if self.ToughnessZ > 5 then
	self.ToughnessZ = 5
	end
	if self.Dragon then
	self.Style = 1
	elseif self.Rush then
	self.Style = 2
	elseif self.Beast then
	self.Style = 3
	end
	if self:IsPossessed() then
		if self.Changed and not self:GetPossessor():KeyDown(IN_ATTACK2) then
			self.Changed = false
		end
	end
	if (self:GetSequenceName(self:GetSequence()) == "into_brawler" or self:GetSequenceName(self:GetSequence()) == "into_beast" or self:GetSequenceName(self:GetSequence()) == "dragonstyle" or self:GetSequenceName(self:GetSequence()) == "into_rush") and self.StyleSwitching  then
		game.SetTimeScale(0.2)
	elseif not (self:GetSequenceName(self:GetSequence()) == "into_brawler" or self:GetSequenceName(self:GetSequence()) == "into_beast" or self:GetSequenceName(self:GetSequence()) == "dragonstyle" or self:GetSequenceName(self:GetSequence()) == "into_rush") and self.StyleSwitching then
		self.StyleSwitching = false
		game.SetTimeScale(1)
	end
	if self:GetSequenceName(self:GetSequence()) == "standup_f" and self.Dragon or self:GetSequenceName(self:GetSequence()) == "kiryu_standup_b" and self.Dragon or self:GetSequenceName(self:GetSequence()) == "down_fatal_b_en" and self.Dragon or self:GetSequenceName(self:GetSequence()) == "down_fatal_f_en" and self.Dragon then
	self.GettUp = true
	else
	if self.GettUp then
	self.GettUp = false
	end
	end
	if self.Beast then
	for k,v in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,0)), 340)) do
			if self:GetPos():Distance(v:GetPos()) < 330 then
			if string.find(v:GetClass(), "drg_scot_*") and not v:IsInFaction(FACTION_REBELS) then
				if v != self then
				if self.BETarget1 == nill and not v:IsDead() then
				self.BETarget1 = v
				if v.BETargeet2 then
				self.BETarget2 = nill
				v.BETargeet2 = false
				end
				if v.BETargeet3 then
				self.BETarget3 = nill
				v.BETargeet3 = false
				end
				if v.BETargeet4 then
				self.BETarget4 = nill
				v.BETargeet4 = false
				end
				v.BETargeet1 = true
				elseif self.BETarget2 == nill and not v:IsDead() then
				self.BETarget2 = v
				if v.BETargeet3 then
				self.BETarget3 = nill
				v.BETargeet3 = false
				end
				if v.BETargeet1 then
				self.BETarget1 = nill
				v.BETargeet1 = false
				end
				if v.BETargeet4 then
				self.BETarget4 = nill
				v.BETargeet4 = false
				end
				v.BETargeet2 = true
				elseif self.BETarget3 == nill and not v:IsDead() then
				self.BETarget3 = v
				if v.BETargeet2 then
				self.BETarget2 = nill
				v.BETargeet2 = false
				end
				if v.BETargeet1 then
				self.BETarget1 = nill
				v.BETargeet1 = false
				end
				if v.BETargeet4 then
				self.BETarget4 = nill
				v.BETargeet4 = false
				end
				v.BETargeet3 = true
				elseif self.BETarget4 == nill and not v:IsDead() then
				self.BETarget4 = v
				if v.BETargeet2 then
				self.BETarget2 = nill
				v.BETargeet2 = false
				end
				if v.BETargeet1 then
				self.BETarget1 = nill
				v.BETargeet1 = false
				end
				if v.BETargeet3 then
				self.BETarget3 = nill
				v.BETargeet3 = false
				end
				v.BETargeet4 = true
				end
			end
			end 
			if self:GetPos():Distance(v:GetPos()) > 329 or string.find(v:GetClass(), "drg_scot_*") and v:IsDead() then
				if v.BETargeet2 then
				self.BETarget2 = nill
				v.BETargeet2 = false
				end
				if v.BETargeet3 then
				self.BETarget3 = nill
				v.BETargeet3 = false
				end
				if v.BETargeet1 then
				self.BETarget1 = nill
				v.BETargeet1 = false
				end
				if v.BETargeet4 then
				self.BETarget4 = nill
				v.BETargeet4 = false
				end
			end
			end
		end
	end
	if self.Combat then
	for k,v in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,0)), 210)) do
			if self:GetPos():Distance(v:GetPos()) < 200 then
			if string.find(v:GetClass(), "drg_scot_*") and not v:IsInFaction(FACTION_REBELS) and v.Attacking then
				if v != self then
				if self.NTarget1 == nill and not v:IsDead() then
				self.NTarget1 = v
				v.NTargeet1 = true
				end
				end
			end 
			if self:GetPos():Distance(v:GetPos()) > 199 or string.find(v:GetClass(), "drg_scot_*") and (v:IsDead() or not v.Attacking) then
				if v.NTargeet1 then
				self.NTarget1 = nill
				v.NTargeet1 = false
				end
			end
			end
		end
		end
	for k,v in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,0)), 210)) do
			if self:GetPos():Distance(v:GetPos()) < 200 then
			if string.find(v:GetClass(), "drg_scot_0nishik*") then
				if self.Nishiki == nill and not v:IsDead() then
				self.Nishiki = v
				v.Nishikie = true
				end
			end 
			if self:GetPos():Distance(v:GetPos()) > 199 or string.find(v:GetClass(), "drg_scot_0nishiki*") and (v:IsDead()) then
				if v.Nishikie then
				self.Nishiki = nill
				v.Nishikie = false
				end
			end
		end
	end
	if not IsValid(self.BETarget1) then
	self.BETarget1 = nill
	end
	if not IsValid(self.BETarget2) then
	self.BETarget2 = nill
	end
	if not IsValid(self.BETarget3) then
	self.BETarget3 = nill
	end
	if not IsValid(self.BETarget4) then
	self.BETarget4 = nill
	end
	if not IsValid(self.NTarget1) then
	self.NTarget1 = nill
	end
	if not IsValid(self.Nishiki) then
	self.Nishiki = nill
	end
	if self.BETarget1 == self then
	self.BETarget1 = nill
	self.BETargeet1 = false
	end
	if self.BETarget2 == self then
	self.BETarget2 = nill
	self.BETargeet2 = false
	end
	if self.BETarget3 == self then
	self.BETarget3 = nill
	self.BETargeet3 = false
	end
	if self.BETarget4 == self then
	self.BETarget4 = nill
	self.BETargeet4 = false
	end
	if self.NTarget1 == self then
	self.NTarget1 = nill
	self.NTargeet1 = false
	end
	for k,v in pairs(ents.FindByClass("obj_yakuza_0amonpotion")) do
	if IsValid(v) then
	if self:GetPos():Distance(v:GetPos()) < 50 then
	v:Remove()
  	self:CICO(function()
	self:SetCooldown("Invincible",self:GetCooldown("Invincible")+10)
	self:PlaySequenceAndMove("roar",1,self.FaceEnemy)
	self.Running = false
	end)
	else
	if not self.Running and not self:IsPossessed() and not self.HeatAction then
	self.Running = true
  	self:CallInCoroutine(function(self)
	if IsValid(v) then
	self:GoTo(v:GetPos())
	end
	self.Running = false
	end)
	end
	end
	end
	end
	if self:IsPossessed() and not (self:IsDown() or self:IsDead() or self.Downed or not self.Combat or self.Tire) then
		if IsValid(self:PossessionGetLockedOn()) then
		if self:PossessionGetLockedOn():LookupBone("face_c_n") then
		self:DirectPoseParametersAt( self:PossessionGetLockedOn():GetBonePosition( self:PossessionGetLockedOn():LookupBone("face_c_n")), "aim_pitch", "aim_yaw", self:EyePos())
		else
		self:DirectPoseParametersAt(self:PossessorTrace().HitPos, "aim_pitch", "aim_yaw", self:EyePos())
		end
		end
		if not IsValid(self:PossessionGetLockedOn()) then
		self:DirectPoseParametersAt(self:PossessorTrace().HitPos, "aim_pitch", "aim_yaw", self:EyePos())
		end
	elseif self:HasEnemy() and self:IsInSight(self:GetEnemy()) and not (self:IsDown() or self:IsDead() or self.Downed or not self.Combat or self.Tire) then
		if self:GetEnemy():LookupBone("face_c_n") then
		self:DirectPoseParametersAt(self:GetEnemy():GetBonePosition(self:GetEnemy():LookupBone("face_c_n")), "aim_pitch", "aim_yaw", self:EyePos())
		else
		self:DirectPoseParametersAt(self:GetEnemy():GetPos(), "aim_pitch", "aim_yaw", self:EyePos())
		end
	else self:DirectPoseParametersAt(nil, "aim_pitch", "aim_yaw", self:EyePos()) end
if self.Bounding1 or self.Bounding2 or self.Bounding3 or self.Bounding4 then
	if not IsValid(self.BoundPos) and IsValid(self.BoundTarget) then
	self.BoundPos = ents.Create("prop_physics")
	self.BoundPos:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	self.BoundPos:Spawn()
	self.BoundPos:SetNotSolid(true)
	self.BoundPos:SetMaterial("models/scot/yakuza0/heat/heat")
	self.BoundPos:SetParent(self.BoundTarget)
	self.BoundPos:Fire("setparentattachment","tester")
	end
for k,v in pairs(ents.FindInSphere(self.BoundPos:LocalToWorld(Vector(0,0,0)), 46)) do
	if IsValid(v) then
	if self.Bounding1 and not v.Collateral and self.BoundPos:GetPos():Distance(v:GetPos()) < 45 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 20 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_NEVERGIB ) 
	d:SetDamagePosition( self.BoundPos:GetPos() ) 
	v:TakeDamageInfo(d)
	v.Collateral = true
	self.BoundPos:EmitSound("yakuza0/weapons/fists/hit"..math.random(4)..".wav")
	end
	if self.Bounding2 and not v.Collateral and self.BoundPos:GetPos():Distance(v:GetPos()) < 45 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 20 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_DIRECT ) 
	d:SetDamagePosition( self.BoundPos:GetPos() ) 
	v:TakeDamageInfo(d)
	v.Collateral = true
	self.BoundPos:EmitSound("yakuza0/weapons/fists/hit"..math.random(4)..".wav")
	end
	if self.Bounding3 and not v.Collateral and self.BoundPos:GetPos():Distance(v:GetPos()) < 45 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 20 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_PHYSGUN ) 
	d:SetDamagePosition( self.BoundPos:GetPos() ) 
	v:TakeDamageInfo(d)
	v.Collateral = true
	self.BoundPos:EmitSound("yakuza0/weapons/fists/hit"..math.random(4)..".wav")
	end
	if self.Bounding4 and not v.Collateral and self.BoundPos:GetPos():Distance(v:GetPos()) < 45 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 45 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_CRUSH ) 
	d:SetDamagePosition( self.BoundPos:GetPos() ) 
	v:TakeDamageInfo(d)
	v.Collateral = true
	self.BoundPos:EmitSound("yakuza0/weapons/fists/hit"..math.random(4)..".wav")
	end
end
end
else
	if IsValid(self.BoundPos) then
	self.BoundPos:Remove()
	end
end
if self.Charging then
for k,v in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,0)), 46)) do
	if IsValid(v) then
	if self.Charging and not v.KCharged and not v.Downed and self:GetPos():Distance(v:GetPos()) < 45 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 1 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_BURN ) 
	d:SetDamagePosition( self:GetPos() ) 
	v:TakeDamageInfo(d)
	v.KCharged = true
	end
end
end
end
if self.Busting and IsValid(self.Door) then
for k,v in pairs(ents.FindInSphere(self.Door:LocalToWorld(Vector(0,0,0)), 150)) do
	if IsValid(v) then
	if not v.Collateral and self.Door:GetPos():Distance(v:GetPos()) < 100 and self:Disposition(v) == D_HT then
	local d = DamageInfo()
	d:SetDamage( 25 )
	d:SetAttacker( self )
	d:SetInflictor( self )
	d:SetDamageType( DMG_PHYSGUN ) 
	d:SetDamagePosition( self.Door:GetPos() ) 
	v:TakeDamageInfo(d)
	v.Collateral = true
	self:Timer(1,function()
	if IsValid(self) then
	if IsValid(v) then
	v.Collateral = true
	end
	end
	end)
	end
end
end
end
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
elseif CLIENT then
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.life = Material("hud/yakuza/life.png", "smooth unlitgeneric")
ENT.bar = Material("hud/yakuza/bar.png", "smooth unlitgeneric")
ENT.heat = Material("hud/yakuza/heat.png", "smooth unlitgeneric")
ENT.itembox = Material("hud/yakuza/uibox.png", "smooth unlitgeneric")
ENT.toughness = Material("hud/yakuza/ui_bottle.png", "smooth unlitgeneric")
ENT.item0 = Material("hud/yakuza/ui_0.png", "smooth unlitgeneric")
ENT.item1 = Material("hud/yakuza/ui_1.png", "smooth unlitgeneric")
ENT.item2 = Material("hud/yakuza/ui_2.png", "smooth unlitgeneric")
ENT.item3 = Material("hud/yakuza/ui_3.png", "smooth unlitgeneric")
ENT.item4 = Material("hud/yakuza/ui_4.png", "smooth unlitgeneric")
ENT.item5 = Material("hud/yakuza/ui_5.png", "smooth unlitgeneric")
ENT.style1 = Material("hud/LikeABrawler/BrawlerNew.png", "smooth unlitgeneric")
ENT.style2 = Material("hud/LikeABrawler/RushNew.png", "smooth unlitgeneric")
ENT.style3 = Material("hud/LikeABrawler/beastnew.png", "smooth unlitgeneric")
function ENT:PossessionHUD()
	local hp = math.Round(self:Health())
	local stam = math.Round(self:GetHeatB())
	local hpmax = self:GetMaxHealth()
	local item = self:GetHealCount()
	local style = self:GetStyleCheck()
	render.SetMaterial(self.itembox)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		128,
		85,
		((self.itembox:Width()*0.7)*1),
		self.itembox:Height()*0.7
	)
	render.SetMaterial(self.toughness)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		128,
		85,
		((self.toughness:Width()*0.7)*1),
		self.toughness:Height()*0.7
	)
	render.SetMaterial(self.bar)
	render.DrawScreenQuadEx(
		160,70,
		self.bar:Width()*3,
		self.bar:Height()*1.5
	)
	render.SetMaterial(self.life)
	local widthscale = (hp/hpmax)
	render.DrawScreenQuadEx(
		185,
		80,
		((self.life:Width()*5.53)*widthscale),
		self.life:Height()*0.95
	)
	render.SetMaterial(self.heat)
	local widthscale = (stam/300)
	render.DrawScreenQuadEx(
		185,
		105.5,
		((self.heat:Width()*2.78)*widthscale),
		self.heat:Height()*0.35
	)		
	if style == 1 then
	render.SetMaterial(self.style1)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		-90,
		15,
		((self.style1:Width()*.25)*1),
		self.style1:Height()*.23
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if style == 2 then
	render.SetMaterial(self.style2)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
	   -40,
		40,
		((self.style2:Width()*.16)*1),
		self.style2:Height()*.18
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if style == 3 then
	render.SetMaterial(self.style3)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		-170,
		20,
		((self.style3:Width()*.32)*1),
		self.style3:Height()*.3
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 0 then
	render.SetMaterial(self.item0)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item0:Width()*0.7)*1),
		self.item0:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 1 then
	render.SetMaterial(self.item1)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item1:Width()*0.7)*1),
		self.item1:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 2 then
	render.SetMaterial(self.item2)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item2:Width()*0.7)*1),
		self.item2:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 3 then
	render.SetMaterial(self.item3)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item3:Width()*0.7)*1),
		self.item3:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 4 then
	render.SetMaterial(self.item4)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item4:Width()*0.7)*1),
		self.item4:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
	if item == 5 then
	render.SetMaterial(self.item5)
	local widthscale = (50/50)
	render.DrawScreenQuadEx(
		132,
		85,
		((self.item5:Width()*0.7)*1),
		self.item5:Height()*0.7
	)	
	else
	if IsValid(render) then
	render:Remove()
	end
	end
end
end
function ENT:SetupDataTables()
	self:NetworkVar("Float", 1, "HeatB")
	self:NetworkVar("Float", 2, "HealCount")
	self:NetworkVar("Float", 3, "StyleCheck")
end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)