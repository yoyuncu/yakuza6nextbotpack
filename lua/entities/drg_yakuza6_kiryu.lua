if not DrGBase then return end
ENT.Base = "drgbase_nextbot"

-- Printing --
ENT.PrintName = "Kazuma Kiryu"
ENT.Category = "Yakuza 6: Song Of Life"
ENT.Models = {"models/yakuza6/kazumakiryu.mdl"}
ENT.CollisionBounds = Vector(13, 13, 74)
ENT.ModelScale = 1

-- Stats --
ENT.SpawnHealth = 1500
ENT.ShoveResistance = true
ENT.MeleeAttackRange = 32
ENT.RangeAttackRange = 56
ENT.ReachEnemyRange = 96
ENT.StrafeMin = 14
ENT.StrafeMax = 314
ENT.Factions = {FACTION_REBELS}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.Omniscient = false
ENT.SpotDuration = 60
ENT.SightFOV = 180
ENT.UseWalkframes = true
ENT.IdleAnimation = "[AKIYAMA]_idle"
ENT.WalkAnimation = "[Akiyama]_walk"
ENT.RunAnimation = "[Akiyama]_battle_run"
ENT.DefaultRelationship = D_HT
ENT.PlayersRelationship = D_LK
ENT.ClimbLedges = false
ENT.ClimbProps = false
ENT.ClimbLadders = false
ENT.RagdollOnDeath = false

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionCrosshair = false
ENT.PossessionMovement = POSSESSION_MOVE_CUSTOM
ENT.PossessionViews = {{offset = Vector(0, 0, 32),distance = 111,eyepos=false},{offset = Vector(0, 0, 48),distance = 125,eyepos=false}}
ENT.PossessionBinds = {

	[IN_ATTACK] = {{coroutine = false,onkeydown = function(self)
	if self.Cmb01 and self.Combat and not self.Heavy and not self.Downed and not self.Hurting and not self.Dodging then
	self.Cmb01 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 17.5
	self.DamageType = DMG_GENERIC
	self.Range = 16
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_01",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb02 = false
	self.Attacking = false
	end)
	end
	if self.Cmb02 then
	self.Cmb02 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 12.5
	self.DamageType = DMG_GENERIC
	self.Range = 15
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_02",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb03 = false
	self.Attacking = false
	end)
	end
	if self.Cmb03 then
	self.Cmb03 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 15
	self.DamageType = DMG_GENERIC
	self.Range = 14
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_03",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb04 = false
	self.Attacking = false
	end)
	end
	if self.Cmb04 then
	self.Cmb04 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 25
	self.DamageType = DMG_GENERIC
	self.Range = 17
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_04",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb05 = false
	self.Attacking = false
	end)
	end
	if self.Cmb05 then
	self.Cmb05 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 25
	self.DamageType = DMG_GENERIC
	self.Range = 35
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_05",1.75,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb06 = false
	self.Attacking = false
	end)
	end
	if self.Cmb06 then
	self.Cmb06 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 25
	self.DamageType = DMG_GENERIC
	self.Range = 35
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_06",1.75,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb07 = false
	self.Attacking = false
	end)
	end
	if self.Cmb07 then
	self.Cmb07 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 25
	self.DamageType = DMG_GENERIC
	self.Range = 35
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_07",1.75,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb08 = false
	self.Attacking = false
	end)
	end
	if self.Cmb08 then
	self.Cmb08 = false
	self:CICO(function()
	self.Attacking = true
	self.Damage = 35
	self.DamageType = DMG_GENERIC
	self.Range = 25
	self:PlaySequenceAndMove("[AKIYAMA]_Combo_08",1.75,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
	self.Cmb01 = true
	self.Cmb09 = false
	self.Attacking = false
	end)
	end
	end}},

	[IN_ATTACK2] = {{coroutine = false,onkeydown = function(self)
	if self.Taunting and self.Attacking then return end
	if self.Combat and not self.Attacking and self:GetCooldown("HeavyCooldown")<=0 and not self.Downed and not self.Hurting and not self.Dodging and self:PossessionGetLockedOn().Downed then
		self:CICO(function()
		self.Heavy = true
		self:SetCooldown("HeavyCooldown",(1))
		self.Damage = 10
		self.DamageType = DMG_BLAST
		self.Range = 25
		self:PlaySequenceAndMove("[Akiyama]_Attack_Down",1)
		self.Heavy = false
		end)
	elseif self.Combat and not self.Attacking and self:GetCooldown("HeavyCooldown")<=0 and not self.Downed and not self.Hurting and not self.Dodging then
		self:CICO(function()
		self.Heavy = true
		self:SetCooldown("HeavyCooldown",(1))
		self.Damage = 10
		self.DamageType = DMG_GENERIC
		self.Range = 17
		self:PlaySequenceAndMove("[Akiyama]_Attack_Heavy_1",1)
		self.Heavy = false
		end)
	end
		if self.Cmb02 and self.Attacking then
		self.Cmb02 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 28
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_01A",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb03 and self.Attacking then
		self.Cmb03 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 29
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_02A",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb04 and self.Attacking then
		self.Cmb04 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 30
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_03A",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb05 and self.Attacking then
		self.Cmb05 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 31
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_04A",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb06 and self.Attacking then
		self.Cmb06 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 32
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_Flurry",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb07 and self.Attacking then
		self.Cmb07 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 33
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_Flurry",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb08 and self.Attacking then
		self.Cmb08 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 34
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_Flurry",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
		if self.Cmb09 and self.Attacking then
		self.Cmb09 = false
		self:CICO(function()
		self.Attacking = true
		self.Damage = 35
		self.DamageType = DMG_BLAST
		self.Range = 32
		self:PlaySequenceAndMove("[AKIYAMA]_Finisher_Flurry",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Cmb01 = true
		end)
	end
	end}},

	[IN_RELOAD] = {{coroutine = false,onkeydown = function(self)
	if self.Attacking then return end
	if not self.Combat and not self.Attacking and self:GetCooldown("StartCooldown")<=0 then
		self:CICO(function()
		local chooseintro = math.random(3)
		if chooseintro==1 then
		self:SetCooldown("StartCooldown",(6))
		self:PlaySequenceAndMove("[Akiyama]_Start_1",1)
		self.Combat = true
		elseif chooseintro==2 then
		self:SetCooldown("StartCooldown",(6))
		self:PlaySequenceAndMove("[Akiyama]_Start_2",1)
		self.Combat = true
		elseif chooseintro==3 then
		self:SetCooldown("StartCooldown",(6))
		self:PlaySequenceAndMove("[Akiyama]_Start_3",1)
		self.Combat = true
		end
		end)
	self.IdleAnimation = "[AKIYAMA]_Battle_Stance"
	self.WalkAnimation = "[Akiyama]_shift"
	end
	if self.Combat and self:GetCooldown("TauntCooldown")<=0 and self:PossessionGetLockedOn().Downed then
		self:CICO(function()
		self.Taunting = true
		self:SetCooldown("TauntCooldown",(2.675))
		self:PlaySequenceAndMove("[Akiyama]_Provoke_Down",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Taunting = false
		end)
	elseif self.Combat and self:GetCooldown("TauntCooldown")<=0 then
		self:CICO(function()
		self.Taunting = true
		self:SetCooldown("TauntCooldown",(2.675))
		self:PlaySequenceAndMove("[Akiyama]_Provoke",1,function(self,cycle)if cycle < 0.5 then self:PossessionFaceForward() end end)
		self.Taunting = false
		end)
	end
		if GetConVarNumber("akiyama_music") == 1 then
			self:EmitSound("")
		if !self.ThemeSongLoop then 
			self:EmitSound("DrgYakuza4Remastered/common/battle_begin.wav",0.5)
			self.ThemeSongLoop = CreateSound(game.GetWorld(),"DrgYakuza4Remastered/music/speed star.wav")
			self.ThemeSongLoop:SetSoundLevel(0)
			
		end
		self.ThemeSongLoop:Play()
		end
	end}},

	[IN_USE] = {{coroutine = false,onkeydown = function(self)
		local possessor = self:GetPossessor()
		local f = possessor:KeyDown(IN_FORWARD)
		local b = possessor:KeyDown(IN_BACK)
		local l = possessor:KeyDown(IN_MOVELEFT)
		local r = possessor:KeyDown(IN_MOVERIGHT)
		local forward = f and not b
		local backward = b and not f
		local right = r and not l
		local left = l and not r
		if forward and self:GetCooldown("DodgeCooldown")<=0 and not self.Downed and not self.Hurting and not self.Attacking then
			self:CICO(function()
			self.Dodging = true
			self:SetCooldown("DodgeCooldown",(1))
			self:PlaySequenceAndMove("[DODGE]_sway_f",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self.Dodging = false
			end)
		elseif left and self:GetCooldown("DodgeCooldown")<=0 and not self.Downed and not self.Hurting and not self.Attacking then
			self:CICO(function()
			self.Dodging = true
			self:SetCooldown("DodgeCooldown",(1))
			self:PlaySequenceAndMove("[DODGE]_sway_l",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self.Dodging = false
			end)	
		elseif right and self:GetCooldown("DodgeCooldown")<=0 and not self.Downed and not self.Hurting and not self.Attacking then
			self:CICO(function()
			self.Dodging = true
			self:SetCooldown("DodgeCooldown",(1))
			self:PlaySequenceAndMove("[DODGE]_sway_r",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self.Dodging = false
			end)		
		elseif backward and self:GetCooldown("DodgeCooldown")<=0 and not self.Downed and not self.Hurting and not self.Attacking then
			self:CICO(function()
			self.Dodging = true
			self:SetCooldown("DodgeCooldown",(1))
			self:PlaySequenceAndMove("[DODGE]_sway_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self.Dodging = false
			end)
		elseif self:GetCooldown("DodgeCooldown")<=0 and not self.Downed and not self.Hurting and not self.Attacking then
			self:CICO(function()
			self.Dodging = true
			self:SetCooldown("DodgeCooldown",(1))
			self:PlaySequenceAndMove("[DODGE]_sway_b",1,function(self,cycle)if cycle < 0.5 then self:FaceEnemy() end end)
			self.Dodging = false
			end)
			end
		end}}

}

ENT.SetupType = bit.bor(DMG_GENERIC)
function ENT:HandleAnimEvent(a,b,c,d,e)
	if e == "provoke_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/provo"..math.random(3)..".wav")
	end
	if e == "start_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/start"..math.random(3)..".wav")
	end
	if e == "light_dmg_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/damage_body"..math.random(2)..".wav")
	end
	if e == "heavy_dmg_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/damage_body_big"..math.random(2)..".wav")
	end
	if e == "big_dmg_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/damage_body_massive1.wav")
	end
	if e == "death_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/damage_dead.wav")
	end
	if e == "recover_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/recover"..math.random(2)..".wav")
	end
	if e == "light_atk_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_small"..math.random(3)..".wav")
	end
	if e == "heavy_atk_1_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_big1.wav")
	end
	if e == "heavy_atk_2_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_special3.wav")
	end
	if e == "cmb1_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_small1.wav")
	end
	if e == "cmb2_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_med2.wav")
	end
	if e == "cmb3_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_small2.wav")
	end			
	if e == "cmb4_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_small3.wav")
	end
	if e == "flurry_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_med"..math.random(3)..".wav")
	end
	if e == "fin1_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_massive2.wav")
	end
	if e == "fin2_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_massive2.wav")
	end
	if e == "fin3_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_massive2.wav")
	end
	if e == "fin4_voice" then
		self:EmitSound("DrgYakuza4Remastered/player_akiyama/atk_big1.wav")
	end
	if e == "fall_sound" then
		self:EmitSound("DrgYakuza4Remastered/common/down"..math.random(4)..".wav")
	end
	if e == "sway_sound" then
		self:EmitSound("DrgYakuza4Remastered/common/sway"..math.random(3)..".wav")
	end
	if e == "hit" then
		self:Attack({
			damage = self.Damage,
			type = self.DamageType,
			range = self.Range,
			viewpunch = Angle(20, math.random(-25, 25), 0),
		}, 
		function(self, hit)
			if #hit > 0 then 
				self:EmitSound("DrgYakuza4Remastered/common/punch"..math.random(4)..".wav", 150)
			else
				self:EmitSound("DrgYakuza4Remastered/common/swing_kick"..math.random(3)..".wav", 150)
			end
		end)
	end
		if e == "cmb1_trans" then
		if self:IsPossessed() then
		self.Cmb02 = true
		end
	end
	if e == "cmb2_trans" then
		if self:IsPossessed() then
		self.Cmb03 = true
		end
	end
	if e == "cmb3_trans" then
		if self:IsPossessed() then
		self.Cmb04 = true
		end
	end
	if e == "cmb4_trans" then
		if self:IsPossessed() then
		self.Cmb05 = true
		end
	end
	if e == "cmb5_trans" then
		if self:IsPossessed() then
		self.Cmb06 = true
		end
	end
	if e == "cmb6_trans" then
		if self:IsPossessed() then
		self.Cmb07 = true
		end
	end
	if e == "cmb7_trans" then
		if self:IsPossessed() then
		self.Cmb08 = true
		end
	end
	if e == "cmb8_trans" then
		if self:IsPossessed() then
		self.Cmb09 = true
		end
	end
end

function ENT:OnOtherKilled()
	self:CICO(function()
		self:GetPossessor():ScreenFade( SCREENFADE.IN, Color( 5, 105, 255, 5 ), 0.25, 0.25, SCREENFADE.OUT, Color( 5, 105, 255, 5 ), 0.125, 0.125 )
		self:EmitSound("DrgYakuza4Remastered/common/battle_end.wav",0.5)
	end)
end

function ENT:OnTakeDamage(dmg)
	if self:IsDead() and self.Downed then return end
	if not dmg:IsDamageType(DMG_SHOCK) and not dmg:IsDamageType(DMG_BLAST) and not self.Dodging then
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
				self.Hurting = true
				self:PlaySequenceAndMove("[DMG]_light_F",1)
				self.Hurting = false
			end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
		and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.Hurting = true
				self:PlaySequenceAndMove("[DMG]_light_b",1)
				self.Hurting = false
			end)
		end
	end
	if self:IsDead() then return end
	if dmg:IsDamageType(DMG_SHOCK) then
		self:CICO(function()
		self.Hurting = true
		self:PlaySequenceAndMove("[DMG]_Electricity",1)
		self:PlaySequenceAndMove("[DMG]_standup_b_st",1)
		self:PlaySequenceAndMove("[DMG]_standup_end",1)
		self.Hurting = false
		end)
	end
	if self:IsDead() then return end
	if dmg:IsDamageType(DMG_BLAST) and not self.Downed and not self.Dodging then
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
				self.Downed = true
				self:PlaySequenceAndMove("[DMG]_Heavy_F_st",1)
				self:PlaySequenceAndMove("[DMG]_Heavy_f_en",1)
				self:PlaySequenceAndMove("[DMG]_standup_f_st",1)
				self:PlaySequenceAndMove("[DMG]_standup_end",1)
				self.Downed = false
			end)
		elseif bck:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and bck:DistToSqr(pos) < lft:DistToSqr(pos) 
		and bck:DistToSqr(pos) < rit:DistToSqr(pos) then
			self:CICO(function(self)
				self.Downed = true
				self:PlaySequenceAndMove("[DMG]_Heavy_B_st",1)
				self:PlaySequenceAndMove("[DMG]_Heavy_B_en",1)
				self:PlaySequenceAndMove("[DMG]_standup_b_st",1)
				self:PlaySequenceAndMove("[DMG]_standup_end",1)
				self.Downed = false
			end)
		elseif lft:DistToSqr(pos) < rit:DistToSqr(pos) 
		and lft:DistToSqr(pos) < fwd:DistToSqr(pos) 
		and lft:DistToSqr(pos) < bck:DistToSqr(pos) then
			self:CICO(function(self)
				self.Downed = true
				self:PlaySequenceAndMove("[DMG]_Heavy_l_st",1)
				self:PlaySequenceAndMove("[DMG]_Heavy_l_en",1)
				self:PlaySequenceAndMove("[DMG]_standup_b_st",1)
				self:PlaySequenceAndMove("[DMG]_standup_end",1)
				self.Downed = false
			end)
		elseif rit:DistToSqr(pos) < lft:DistToSqr(pos) 
		and rit:DistToSqr(pos) < bck:DistToSqr(pos) 
		and rit:DistToSqr(pos) < fwd:DistToSqr(pos) then
			self:CICO(function(self)
				self.Downed = true
				self:PlaySequenceAndMove("[DMG]_Heavy_r_st",1)
				self:PlaySequenceAndMove("[DMG]_Heavy_r_en",1)
				self:PlaySequenceAndMove("[DMG]_standup_f_st",1)
				self:PlaySequenceAndMove("[DMG]_standup_end",1)
				self.Downed = false
			end)
		end
	end
end

function ENT:OnDeath()
	self:PlaySequenceAndMove("[DMG]_Death_b",1)
	self:PlaySequenceAndMove("[DMG]_gameover_b",0.5)
		if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
	end
end

function ENT:OnRemove()
		if self.ThemeSongLoop then 
		self.ThemeSongLoop:Stop()
	end
end
-- DO NOT TOUCH --

function ENT:CustomInitialize()
    self.Attacking = false
	self.Combat = false
	self.Cmb01 = true
	self.Heavy = false
	self.Dodging = false
end

function ENT:CICO(callback)
	local oldThread = self.BehaveThread
	self.BehaveThread = coroutine.create(function()
		callback(self)
		self.BehaveThread = oldThread
	end)
end

--	Handle this sexy little fellas UI here, if you have gripes with mine and wanna change it.

function ENT:OnUpdateAnimation()
	if self:IsDead() then return end
	if not self:IsOnGround() then return self.JumpAnimation, self.JumpAnimRate
	elseif self:IsRunning() then return self.RunAnimation, self.RunAnimRate
	elseif self:IsMoving() then return self.WalkAnimation, self.WalkAnimRate
	else return self.IdleAnimation, self.IdleAnimRate 
	end
end





if SERVER then
function ENT:PossessionControls(f,b,r,l)
	if not self:IsRunning() and self.Combat then
		if self:IsMoving() then self:PossessionFaceForward() end
		local dir = self._DrGBasePossLast4DIR or ""
        local dir = self._DrGBasePossLast4DIR or ""
        if f then self:PossessionMoveForward()
        elseif b then self:PossessionMoveBackward() end
        if r then self:PossessionMoveRight()
        elseif l then self:PossessionMoveLeft() end
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
end

AddCSLuaFile()
DrGBase.AddNextbot(ENT)