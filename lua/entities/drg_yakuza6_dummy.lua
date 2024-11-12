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
        self.Karate = true
        elseif moveset==6 then
        self.Pnc = true
        elseif moveset==7 then
        self.Iha = true
        elseif moveset==8 then
        self.Gng = true
        end
        local voice = math.random(1,6)
        if voice==1 then
        self.PainSounds = {"yakuza0/goons/knt/yakuza/inteli/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/yakuza/inteli/damage_head_s1.wav","yakuza0/goons/knt/yakuza/inteli/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/yakuza/inteli/damage_head_l1.wav","yakuza0/goons/knt/yakuza/inteli/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/yakuza/inteli/damage_body_s1.wav","yakuza0/goons/knt/yakuza/inteli/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/yakuza/inteli/damage_body_l1.wav","yakuza0/goons/knt/yakuza/inteli/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/yakuza/inteli/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/knt/yakuza/inteli/stand1.wav","yakuza0/goons/knt/yakuza/inteli/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/yakuza/inteli/attack_s1.wav","yakuza0/goons/knt/yakuza/inteli/attack_s2.wav","yakuza0/goons/knt/yakuza/inteli/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/yakuza/inteli/attack_l1.wav","yakuza0/goons/knt/yakuza/inteli/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/yakuza/inteli/attack_xs1.wav","yakuza0/goons/knt/yakuza/inteli/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/yakuza/inteli/attack_l1.wav","yakuza0/goons/knt/yakuza/inteli/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/yakuza/inteli/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/yakuza/inteli/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/yakuza/inteli/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/yakuza/inteli/provo1.wav","yakuza0/goons/knt/yakuza/inteli/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/yakuza/inteli/dead.wav"}
        elseif voice==2 then
        self.PainSounds = {"yakuza0/goons/knt/yakuza/nrm/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/yakuza/nrm/damage_head_s1.wav","yakuza0/goons/knt/yakuza/nrm/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/yakuza/nrm/damage_head_l1.wav","yakuza0/goons/knt/yakuza/nrm/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/yakuza/nrm/damage_body_s1.wav","yakuza0/goons/knt/yakuza/nrm/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/yakuza/nrm/damage_body_l1.wav","yakuza0/goons/knt/yakuza/nrm/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/yakuza/nrm/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/knt/yakuza/nrm/stand1.wav","yakuza0/goons/knt/yakuza/nrm/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/yakuza/nrm/attack_s1.wav","yakuza0/goons/knt/yakuza/nrm/attack_s2.wav","yakuza0/goons/knt/yakuza/nrm/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/yakuza/nrm/attack_l1.wav","yakuza0/goons/knt/yakuza/nrm/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/yakuza/nrm/attack_xs1.wav","yakuza0/goons/knt/yakuza/nrm/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/yakuza/nrm/attack_l1.wav","yakuza0/goons/knt/yakuza/nrm/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/yakuza/nrm/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/yakuza/nrm/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/yakuza/nrm/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/yakuza/nrm/provo1.wav","yakuza0/goons/knt/yakuza/nrm/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/yakuza/nrm/dead.wav"}
        elseif voice==3 then
        self.PainSounds = {"yakuza0/goons/knt/yakuza/warlike/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/knt/yakuza/warlike/damage_head_s1.wav","yakuza0/goons/knt/yakuza/warlike/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/knt/yakuza/warlike/damage_head_l1.wav","yakuza0/goons/knt/yakuza/warlike/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/knt/yakuza/warlike/damage_body_s1.wav","yakuza0/goons/knt/yakuza/warlike/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/knt/yakuza/warlike/damage_body_l1.wav","yakuza0/goons/knt/yakuza/warlike/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/knt/yakuza/warlike/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/knt/yakuza/warlike/stand1.wav","yakuza0/goons/knt/yakuza/warlike/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/knt/yakuza/warlike/attack_s1.wav","yakuza0/goons/knt/yakuza/warlike/attack_s2.wav","yakuza0/goons/knt/yakuza/warlike/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/knt/yakuza/warlike/attack_l1.wav","yakuza0/goons/knt/yakuza/warlike/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/knt/yakuza/warlike/attack_xs1.wav","yakuza0/goons/knt/yakuza/warlike/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/knt/yakuza/warlike/attack_l1.wav","yakuza0/goons/knt/yakuza/warlike/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/knt/yakuza/warlike/angry.wav"}
        self.FearSounds = {"yakuza0/goons/knt/yakuza/warlike/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/knt/yakuza/warlike/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/knt/yakuza/warlike/provo1.wav","yakuza0/goons/knt/yakuza/warlike/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/knt/yakuza/warlike/dead.wav"}
        elseif voice==4 then
        self.PainSounds = {"yakuza0/goons/osk/yakuza/inteli/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/yakuza/inteli/damage_head_s1.wav","yakuza0/goons/osk/yakuza/inteli/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/yakuza/inteli/damage_head_l1.wav","yakuza0/goons/osk/yakuza/inteli/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/yakuza/inteli/damage_body_s1.wav","yakuza0/goons/osk/yakuza/inteli/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/yakuza/inteli/damage_body_l1.wav","yakuza0/goons/osk/yakuza/inteli/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/yakuza/inteli/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/osk/yakuza/inteli/stand1.wav","yakuza0/goons/osk/yakuza/inteli/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/yakuza/inteli/attack_s1.wav","yakuza0/goons/osk/yakuza/inteli/attack_s2.wav","yakuza0/goons/osk/yakuza/inteli/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/yakuza/inteli/attack_l1.wav","yakuza0/goons/osk/yakuza/inteli/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/yakuza/inteli/attack_xs1.wav","yakuza0/goons/osk/yakuza/inteli/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/yakuza/inteli/attack_l1.wav","yakuza0/goons/osk/yakuza/inteli/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/yakuza/inteli/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/yakuza/inteli/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/yakuza/inteli/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/yakuza/inteli/provo1.wav","yakuza0/goons/osk/yakuza/inteli/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/yakuza/inteli/dead.wav"}
        elseif voice==5 then
        self.PainSounds = {"yakuza0/goons/osk/yakuza/nrm/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/yakuza/nrm/damage_head_s1.wav","yakuza0/goons/osk/yakuza/nrm/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/yakuza/nrm/damage_head_l1.wav","yakuza0/goons/osk/yakuza/nrm/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/yakuza/nrm/damage_body_s1.wav","yakuza0/goons/osk/yakuza/nrm/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/yakuza/nrm/damage_body_l1.wav","yakuza0/goons/osk/yakuza/nrm/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/yakuza/nrm/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/osk/yakuza/nrm/stand1.wav","yakuza0/goons/osk/yakuza/nrm/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/yakuza/nrm/attack_s1.wav","yakuza0/goons/osk/yakuza/nrm/attack_s2.wav","yakuza0/goons/osk/yakuza/nrm/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/yakuza/nrm/attack_l1.wav","yakuza0/goons/osk/yakuza/nrm/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/yakuza/nrm/attack_xs1.wav","yakuza0/goons/osk/yakuza/nrm/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/yakuza/nrm/attack_l1.wav","yakuza0/goons/osk/yakuza/nrm/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/yakuza/nrm/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/yakuza/nrm/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/yakuza/nrm/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/yakuza/nrm/provo1.wav","yakuza0/goons/osk/yakuza/nrm/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/yakuza/nrm/dead.wav"}
        elseif voice==6 then
        self.PainSounds = {"yakuza0/goons/osk/yakuza/warlike/pain.wav"}
        self.PainHeadSounds = {"yakuza0/goons/osk/yakuza/warlike/damage_head_s1.wav","yakuza0/goons/osk/yakuza/warlike/damage_head_s2.wav"}
        self.PainHeadLSounds = {"yakuza0/goons/osk/yakuza/warlike/damage_head_l1.wav","yakuza0/goons/osk/yakuza/warlike/damage_head_l2.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/yakuza/warlike/damage_body_s1.wav","yakuza0/goons/osk/yakuza/warlike/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/yakuza/warlike/damage_body_l1.wav","yakuza0/goons/osk/yakuza/warlike/damage_body_l2.wav"}
        self.PainXLSounds = {"yakuza0/goons/osk/yakuza/warlike/damage_xl.wav"}
        self.StandSounds = {"yakuza0/goons/osk/yakuza/warlike/stand1.wav","yakuza0/goons/osk/yakuza/warlike/stand2.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_s1.wav","yakuza0/goons/osk/yakuza/warlike/attack_s2.wav","yakuza0/goons/osk/yakuza/warlike/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_l1.wav","yakuza0/goons/osk/yakuza/warlike/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_xs1.wav","yakuza0/goons/osk/yakuza/warlike/attack_xs2.wav"}
        self.AttackXLSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_l1.wav","yakuza0/goons/osk/yakuza/warlike/attack_l2.wav"}
        self.AngrySounds = {"yakuza0/goons/osk/yakuza/warlike/angry.wav"}
        self.FearSounds = {"yakuza0/goons/osk/yakuza/warlike/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/yakuza/warlike/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/yakuza/warlike/provo1.wav","yakuza0/goons/osk/yakuza/warlike/provo2.wav"}
        self.DeadSounds = {"yakuza0/goons/osk/yakuza/warlike/dead.wav"}
        elseif voice==7 then
        self.PainSounds = {"player/survivor/voice/gambler/incapacitatedinjury01.wav","player/survivor/voice/gambler/incapacitatedinjury02.wav","player/survivor/voice/gambler/incapacitatedinjury03.wav","player/survivor/voice/gambler/incapacitatedinjury04.wav","player/survivor/voice/gambler/incapacitatedinjury05.wav"}
        self.PainHeadSounds = {"player/survivor/voice/gambler/hurtminor01.wav"}
        self.PainHeadLSounds = {"player/survivor/voice/gambler/hurtmajor01.wav"}
        self.PainBodySounds = {"yakuza0/goons/osk/yakuza/warlike/damage_body_s1.wav","yakuza0/goons/osk/yakuza/warlike/damage_body_s2.wav"}
        self.PainBodyLSounds = {"yakuza0/goons/osk/yakuza/warlike/damage_body_l1.wav","yakuza0/goons/osk/yakuza/warlike/damage_body_l2.wav"}
        self.PainXLSounds = {"player/survivor/voice/gambler/hurtcritical01.wav"}
        self.StandSounds = {"player/survivor/voice/gambler/goingtodie02.wav","player/survivor/voice/gambler/goingtodie03.wav","player/survivor/voice/gambler/goingtodie04.wav","player/survivor/voice/gambler/goingtodie06.wav","player/survivor/voice/gambler/goingtodie09.wav","player/survivor/voice/gambler/goingtodie10.wav","player/survivor/voice/gambler/goingtodie11.wav","player/survivor/voice/gambler/goingtodie13.wav","player/survivor/voice/gambler/goingtodie14.wav","player/survivor/voice/gambler/goingtodie16.wav"}
        self.AttackSmallSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_s1.wav","yakuza0/goons/osk/yakuza/warlike/attack_s2.wav","yakuza0/goons/osk/yakuza/warlike/attack_s3.wav"}
        self.AttackLargeSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_l1.wav","yakuza0/goons/osk/yakuza/warlike/attack_l2.wav"}
        self.AttackXSSounds = {"yakuza0/goons/osk/yakuza/warlike/attack_xs1.wav","yakuza0/goons/osk/yakuza/warlike/attack_xs2.wav"}
        self.AttackXLSounds = {"player/survivor/voice/gambler/battlecry03.wav"}
        self.AngrySounds = {"player/survivor/voice/gambler/grabbedbysmoker01a.wav","player/survivor/voice/gambler/grabbedbysmoker04.wav","player/survivor/voice/gambler/grabbedbysmoker04a.wav"}
        self.FearSounds = {"yakuza0/goons/osk/yakuza/warlike/fear.wav"}
        self.ThrowSounds = {"yakuza0/goons/osk/yakuza/warlike/throw.wav"}
        self.ProvokeSounds = {"yakuza0/goons/osk/yakuza/warlike/provo1.wav","yakuza0/goons/osk/yakuza/warlike/provo2.wav"}
        self.DeadSounds = {"player/survivor/voice/gambler/deathscream01.wav","player/survivor/voice/gambler/deathscream02.wav","player/survivor/voice/gambler/deathscream03.wav","player/survivor/voice/gambler/deathscream04.wav","player/survivor/voice/gambler/deathscream05.wav","player/survivor/voice/gambler/deathscream06.wav","player/survivor/voice/gambler/deathscream07.wav"}
        self.VanishSounds = {}
        self.SupriseSounds = {}
        self.HoldSounds = {}
        self.StartSounds = {}
        self.TubazeriSounds = {}
        end
        if math.random(7)==4 then
        self.Dosu = true
        self.ConcealKnife = true
        end
        self:SetSkin(math.random(0,7))
        self:SetBodygroup(1,math.random(0,4))
        self:SetBodygroup(2,math.random(0,3))
        self:SetBodygroup(3,math.random(0,27))
        self:SetBodygroup(4,math.random(0,6))
        if self:GetBodygroup(3) == 0 or self:GetBodygroup(3) == 1 or self:GetBodygroup(3) == 2 or self:GetBodygroup(3) == 3 then
        self.B10A = true
        elseif self:GetBodygroup(3) == 4 or self:GetBodygroup(3) == 5 or self:GetBodygroup(3) == 6 then
        self.B20A = true
        if math.random(2)==2 then
        self:SetBodygroup(5,1)
        end
        elseif self:GetBodygroup(3) == 7 then
        self.B20B = true
        elseif self:GetBodygroup(3) == 8 or self:GetBodygroup(3) == 9 or self:GetBodygroup(3) == 10 then
        self.B30A = true
        if math.random(2)==2 then
        self:SetBodygroup(5,2)
        end
        elseif self:GetBodygroup(3) == 11 or self:GetBodygroup(3) == 12 or self:GetBodygroup(3) == 13 or self:GetBodygroup(3) == 14 then
        self.B30B = true
        if math.random(2)==2 then
        self:SetBodygroup(5,3)
        end
        elseif self:GetBodygroup(3) == 15 or self:GetBodygroup(3) == 16 or self:GetBodygroup(3) == 17 then
        self.B30C = true
        if math.random(2)==2 then
        self:SetBodygroup(5,4)
        end
        elseif self:GetBodygroup(3) == 18 then
        self.B40A = true
        elseif self:GetBodygroup(3) == 19 or self:GetBodygroup(3) == 20 or self:GetBodygroup(3) == 21 then
        self.B40B = true
        if math.random(2)==2 then
        self:SetBodygroup(5,5)
        end
        elseif self:GetBodygroup(3) == 22 or self:GetBodygroup(3) == 23 or self:GetBodygroup(3) == 24 then
        self.B40C = true
        if math.random(2)==2 then
        self:SetBodygroup(5,6)
        end
        elseif self:GetBodygroup(3) == 25 then
        self.B40D = true
        if math.random(2)==2 then
        self:SetBodygroup(5,7)
        end
        elseif self:GetBodygroup(3) == 26 then
        self.B50A = true
        if math.random(2)==2 then
        self:SetBodygroup(5,8)
        end
        elseif self:GetBodygroup(3) == 27 then
        self.B50B = true
        if math.random(2)==2 then
        self:SetBodygroup(5,9)
        end
        end
        for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") then self:SetAttack(v,true)end end
        self:SetDefaultRelationship(D_HT)
        if math.random(4)==2 then
        self:GlassesInit()
        end
    end
    end
    
    -- DO NOT TOUCH --
    AddCSLuaFile()
    DrGBase.AddNextbot(ENT)