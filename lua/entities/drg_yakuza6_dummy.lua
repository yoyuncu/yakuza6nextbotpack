if not DrGBase then return end
ENT.Base = "drg_yakuza6_goonbase"

-- Editables --
ENT.PrintName = "c_cm_dummy"
ENT.Category = "Yakuza 6"
ENT.Models = {"models/yakuza6/c_cm_dummy.mdl",}
ENT.CollisionBounds = Vector(13, 13, 74)
ENT.Factions = {"FACTION_YAKUZA"}
ENT.Spawnable = true

if SERVER then
    function ENT:CustomInitialize()
        self.Combat = false
        self.Attacking = false
        self.Flinches = 0
        self.DFlinches = 0
        self.CanAngry = true
        if math.random(6)==1 then
        self.DynamicIntro = true
        end
        if self.DynamicIntro then
        local rng = math.random(3)
            if rng==1 then
            self.MoneyBeggar = true
            else
            end
        end
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
        self:SetModelScale(1.02)
        elseif e==4 then
        self:SetModelScale(0.935)
        end
        local moveset = math.random(1,3)
        if moveset==1 then
        self.Normal = true
        elseif moveset==2 then
        self.Box = true
        elseif moveset==3 then
        self.KBox = true
        if math.random(2)==1 then
            self.WeaponType = 0
            self.WeaponModel = 1
            self.WeaponGuardSounds = {"yakuza0/weapons/majimabat/guard1.wav","yakuza0/weapons/majimabat/guard2.wav"}
            self.WeaponSwingSounds = {"yakuza0/weapons/majimabat/swing1.wav","yakuza0/weapons/majimabat/swing2.wav"}
            self.WeaponHitSounds = {"yakuza0/weapons/majimabat/hit1.wav","yakuza0/weapons/majimabat/hit2.wav","yakuza0/weapons/majimabat/hit3.wav"}
        else
            self.WeaponType = 1
            self.WeaponModel = 17
            self.WeaponSwingSounds = {"yakuza0/weapons/woodbat/swing1.wav","yakuza0/weapons/woodbat/swing2.wav"}
            self.WeaponHitSounds = {"yakuza0/weapons/woodbat/hit1.wav","yakuza0/weapons/woodbat/hit2.wav","yakuza0/weapons/woodbat/hit3.wav"}
        end
        elseif moveset==8 then
        self.WeaponType = 1
        self.WeaponModel = math.random(10,12)
        self.WeaponGuardSounds = {"yakuza0/weapons/dosu/guard.wav"}
        self.WeaponSwingSounds = {"yakuza0/weapons/dosu/swing1.wav","yakuza0/weapons/dosu/swing2.wav"}
        self.WeaponHitSounds = {"yakuza0/weapons/dosu/hit1.wav","yakuza0/weapons/dosu/hit2.wav"}
        self.Knife = true
        elseif moveset==9 then
        self.WeaponType = 1
        self.WeaponModel = math.random(10,12)
        self.WeaponGuardSounds = {"yakuza0/weapons/dosu/guard.wav"}
        self.WeaponSwingSounds = {"yakuza0/weapons/dosu/swing1.wav","yakuza0/weapons/dosu/swing2.wav"}
        self.WeaponHitSounds = {"yakuza0/weapons/dosu/hit1.wav","yakuza0/weapons/dosu/hit2.wav"}
        self.Knife2 = true
        elseif moveset==10 then
        self.WeaponType = 0
        self.WeaponModel = 13
        self.WeaponGuardSounds = {"yakuza0/weapons/majimabat/guard1.wav","yakuza0/weapons/majimabat/guard2.wav"}
        self.WeaponSwingSounds = {"yakuza0/weapons/majimabat/swing1.wav","yakuza0/weapons/majimabat/swing2.wav"}
        self.WeaponHitSounds = {"yakuza0/weapons/majimabat/hit1.wav","yakuza0/weapons/majimabat/hit2.wav","yakuza0/weapons/majimabat/hit3.wav"}
        self.Pipe = true
        elseif moveset==11 then
        self.Gng = true
        elseif moveset==12 then
        self.Cap = true
        end
        local voice = math.random(1,6)
        if voice==1 then
        self.PainSounds = {"yakuza0/goons/knt/young/fine/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/young/fine/damage_head_s1.wav","yakuza0/goons/knt/young/fine/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/young/fine/damage_head_l1.wav","yakuza0/goons/knt/young/fine/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/young/fine/damage_body_s1.wav","yakuza0/goons/knt/young/fine/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/young/fine/damage_body_l1.wav","yakuza0/goons/knt/young/fine/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/young/fine/damage_xl1.wav","yakuza0/goons/knt/young/fine/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/knt/young/fine/stand1.wav","yakuza0/goons/knt/young/fine/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/young/fine/attack_s1.wav","yakuza0/goons/knt/young/fine/attack_s2.wav","yakuza0/goons/knt/young/fine/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/young/fine/attack_l1.wav","yakuza0/goons/knt/young/fine/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/young/fine/attack_xs1.wav","yakuza0/goons/knt/young/fine/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/young/fine/attack_l1.wav","yakuza0/goons/knt/young/fine/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/young/fine/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/young/fine/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/young/fine/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/young/fine/provo1.wav","yakuza0/goons/knt/young/fine/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/young/fine/dead1.wav","yakuza0/goons/knt/young/fine/dead2.wav"}
        elseif voice==2 then
        self.PainSounds = {"yakuza0/goons/knt/young/mild/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/young/mild/damage_head_s1.wav","yakuza0/goons/knt/young/mild/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/young/mild/damage_head_l1.wav","yakuza0/goons/knt/young/mild/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/young/mild/damage_body_s1.wav","yakuza0/goons/knt/young/mild/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/young/mild/damage_body_l1.wav","yakuza0/goons/knt/young/mild/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/young/mild/damage_xl1.wav","yakuza0/goons/knt/young/mild/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/knt/young/mild/stand1.wav","yakuza0/goons/knt/young/mild/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/young/mild/attack_s1.wav","yakuza0/goons/knt/young/mild/attack_s2.wav","yakuza0/goons/knt/young/mild/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/young/mild/attack_l1.wav","yakuza0/goons/knt/young/mild/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/young/mild/attack_xs1.wav","yakuza0/goons/knt/young/mild/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/young/mild/attack_l1.wav","yakuza0/goons/knt/young/mild/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/young/mild/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/young/mild/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/young/mild/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/young/mild/provo1.wav","yakuza0/goons/knt/young/mild/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/young/mild/dead1.wav","yakuza0/goons/knt/young/mild/dead2.wav"}
        elseif voice==3 then
        self.PainSounds = {"yakuza0/goons/knt/young/nrm/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/young/nrm/damage_head_s1.wav","yakuza0/goons/knt/young/nrm/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/young/nrm/damage_head_l1.wav","yakuza0/goons/knt/young/nrm/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/young/nrm/damage_body_s1.wav","yakuza0/goons/knt/young/nrm/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/young/nrm/damage_body_l1.wav","yakuza0/goons/knt/young/nrm/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/young/nrm/damage_xl1.wav","yakuza0/goons/knt/young/nrm/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/knt/young/nrm/stand1.wav","yakuza0/goons/knt/young/nrm/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/young/nrm/attack_s1.wav","yakuza0/goons/knt/young/nrm/attack_s2.wav","yakuza0/goons/knt/young/nrm/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/young/nrm/attack_l1.wav","yakuza0/goons/knt/young/nrm/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/young/nrm/attack_xs1.wav","yakuza0/goons/knt/young/nrm/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/young/nrm/attack_l1.wav","yakuza0/goons/knt/young/nrm/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/young/nrm/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/young/nrm/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/young/nrm/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/young/nrm/provo1.wav","yakuza0/goons/knt/young/nrm/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/young/nrm/dead1.wav","yakuza0/goons/knt/young/nrm/dead2.wav"}
        elseif voice==4 then
        self.PainSounds = {"yakuza0/goons/osk/young/nrm/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/young/nrm/damage_head_s1.wav","yakuza0/goons/osk/young/nrm/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/young/nrm/damage_head_l1.wav","yakuza0/goons/osk/young/nrm/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/young/nrm/damage_body_s1.wav","yakuza0/goons/osk/young/nrm/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/young/nrm/damage_body_l1.wav","yakuza0/goons/osk/young/nrm/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/young/nrm/damage_xl1.wav","yakuza0/goons/osk/young/nrm/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/osk/young/nrm/stand1.wav","yakuza0/goons/osk/young/nrm/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/young/nrm/attack_s1.wav","yakuza0/goons/osk/young/nrm/attack_s2.wav","yakuza0/goons/osk/young/nrm/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/young/nrm/attack_l1.wav","yakuza0/goons/osk/young/nrm/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/young/nrm/attack_xs1.wav","yakuza0/goons/osk/young/nrm/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/young/nrm/attack_l1.wav","yakuza0/goons/osk/young/nrm/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/young/nrm/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/young/nrm/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/young/nrm/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/young/nrm/provo1.wav","yakuza0/goons/osk/young/nrm/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/young/nrm/dead1.wav","yakuza0/goons/osk/young/nrm/dead2.wav"}
        elseif voice==5 then
        self.PainSounds = {"yakuza0/goons/osk/young/fine/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/young/fine/damage_head_s1.wav","yakuza0/goons/osk/young/fine/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/young/fine/damage_head_l1.wav","yakuza0/goons/osk/young/fine/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/young/fine/damage_body_s1.wav","yakuza0/goons/osk/young/fine/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/young/fine/damage_body_l1.wav","yakuza0/goons/osk/young/fine/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/young/fine/damage_xl1.wav","yakuza0/goons/osk/young/fine/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/osk/young/fine/stand1.wav","yakuza0/goons/osk/young/fine/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/young/fine/attack_s1.wav","yakuza0/goons/osk/young/fine/attack_s2.wav","yakuza0/goons/osk/young/fine/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/young/fine/attack_l1.wav","yakuza0/goons/osk/young/fine/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/young/fine/attack_xs1.wav","yakuza0/goons/osk/young/fine/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/young/fine/attack_l1.wav","yakuza0/goons/osk/young/fine/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/young/fine/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/young/fine/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/young/fine/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/young/fine/provo1.wav","yakuza0/goons/osk/young/fine/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/young/fine/dead1.wav","yakuza0/goons/osk/young/fine/dead2.wav"}
        elseif voice==6 then
        self.PainSounds = {"yakuza0/goons/osk/young/mild/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/young/mild/damage_head_s1.wav","yakuza0/goons/osk/young/mild/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/young/mild/damage_head_l1.wav","yakuza0/goons/osk/young/mild/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/young/mild/damage_body_s1.wav","yakuza0/goons/osk/young/mild/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/young/mild/damage_body_l1.wav","yakuza0/goons/osk/young/mild/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/young/mild/damage_xl1.wav","yakuza0/goons/osk/young/mild/damage_xl2.wav"}
        self.StandSounds = {"yakuza0/goons/osk/young/mild/stand1.wav","yakuza0/goons/osk/young/mild/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/young/mild/attack_s1.wav","yakuza0/goons/osk/young/mild/attack_s2.wav","yakuza0/goons/osk/young/mild/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/young/mild/attack_l1.wav","yakuza0/goons/osk/young/mild/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/young/mild/attack_xs1.wav","yakuza0/goons/osk/young/mild/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/young/mild/attack_l1.wav","yakuza0/goons/osk/young/mild/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/young/mild/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/young/mild/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/young/mild/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/young/mild/provo1.wav","yakuza0/goons/osk/young/mild/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/young/mild/dead1.wav","yakuza0/goons/osk/young/mild/dead2.wav"}
        end
        if math.random(6)==3 then
        self.ConcealKnife = true
        end
        if self:GetModel() == "models/scot/yakuza0/delinquent.mdl" then
        self:SetSkin(math.random(0,6))
        self:SetBodygroup(1,math.random(0,2))
        self:SetBodygroup(3,math.random(0,7))
        self:SetBodygroup(4,math.random(0,4))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,2))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_stajan.mdl" then
        self:SetSkin(math.random(0,5))
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(4,math.random(0,9))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,2))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_down.mdl" then
        self:SetSkin(math.random(0,6))
        self:SetBodygroup(0,math.random(0,1))
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(4,math.random(0,10))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,3))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_jersey.mdl" then
        self:SetSkin(math.random(0,6))
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(4,math.random(0,7))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,4))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_jerseyb.mdl" then
        self:SetSkin(math.random(0,5))
        self:SetBodygroup(1,math.random(0,2))
        self:SetBodygroup(2,math.random(0,4))
        self:SetBodygroup(3,math.random(0,17))
        if self:GetBodygroup(1) == 2 then
        self:SetBodygroup(4,8)
        self:SetBodygroup(9,math.random(0,2))
        else
        self:SetBodygroup(4,math.random(0,7))
        end
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,4))
        self:SetBodygroup(7,math.random(0,1))
        self:SetBodygroup(8,math.random(0,2))
        self:SetBodygroup(10,math.random(0,4))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_downb.mdl" then
        self:SetSkin(math.random(0,6))
        self:SetBodygroup(0,math.random(0,1))
        if self:GetBodygroup(0)==1 then
        self:SetBodygroup(1,math.random(1,2))
        end
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(4,math.random(0,9))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,3))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_downc.mdl" then
        self:SetSkin(math.random(0,6))
        self:SetBodygroup(0,math.random(0,1))
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(4,math.random(0,9))
        self:SetBodygroup(5,math.random(0,4))
        self:SetBodygroup(6,math.random(0,3))
        elseif self:GetModel() == "models/scot/yakuza0/delinquent_sweater.mdl" then
        self:SetSkin(math.random(0,4))
        self:SetBodygroup(0,math.random(0,2))
        self:SetBodygroup(1,math.random(0,2))
        self:SetBodygroup(3,math.random(0,17))
        self:SetBodygroup(6,math.random(0,4))
        if self:GetBodygroup(6) == 0 then
        self:SetBodygroup(5,math.random(0,4))
        else
        self:SetBodygroup(5,math.random(1,4))
        end
        self:SetBodygroup(7,math.random(0,1))
        if self:GetBodygroup(7) == 1 then
            self:SetBodygroup(4,8)
        else
            self:SetBodygroup(4,math.random(0,7))
        end
        self:SetBodygroup(8,math.random(0,2))
        self:SetBodygroup(9,math.random(0,1))
        self:SetBodygroup(10,math.random(0,1))
        self:SetBodygroup(11,math.random(0,1))
        self:SetBodygroup(12,math.random(0,9))
        end
        for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") then self:SetAttack(v,true)end end
        self:SetDefaultRelationship(D_HT)
    end
    end
    
    -- DO NOT TOUCH --
    AddCSLuaFile()
    DrGBase.AddNextbot(ENT)