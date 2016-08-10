--
-- DPMProfesions.lua
-- User: Tyler
-- Date: 8/8/2016
-- Time: 5:02 PM
--
require "MainCreationMethods"

-- DMPProfessions Object, holds all functions basically.
-- Resource: MainCreationMethods.lua
DPMProfessions = {};
DPMProfessions.DoTraits = function()
    -- Add our dummy, unremovable, traits.
    TraitFactory.addTrait("dpm_KeenHearing", getText("UI_trait_keenhearing"), 0, getText("UI_trait_keenhearingdesc"), true);
    TraitFactory.addTrait("dpm_Cowardly", getText("UI_trait_cowardly"), 0, getText("UI_trait_cowardlydesc"), true);
    TraitFactory.addTrait("dpm_EagleEyed", getText("UI_trait_eagleeyed"), 0, getText("UI_trait_eagleeyeddesc"), true);
    local dpm_Strong = TraitFactory.addTrait("dpm_Strong", getText("UI_trait_strong"), 0, getText("UI_trait_strongdesc"), true);
    dpm_Strong:addXPBoost(Perks.Strength, 4);
    local dpm_Stout = TraitFactory.addTrait("dpm_Stout", getText("UI_trait_stout"), 0, getText("UI_trait_stoutdesc"), true);
    dpm_Stout:addXPBoost(Perks.Strength, 2);
    local dpm_Feeble = TraitFactory.addTrait("dpm_Feeble", getText("UI_trait_feeble"), 0, getText("UI_trait_feebledesc"), true);
    dpm_Feeble:addXPBoost(Perks.Strength, -2);
    TraitFactory.addTrait("dpm_Outdoorsman", getText("UI_trait_outdoorsman"), 0, getText("UI_trait_outdoorsmandesc"), true);
    TraitFactory.addTrait("dpm_FastReader", getText("UI_trait_FastReader"), 0, getText("UI_trait_FastReaderDesc"), true);
    TraitFactory.addTrait("dpm_Organized", getText("UI_trait_Packmule"), 0, getText("UI_trait_PackmuleDesc"), true);
end
DPMProfessions.DoProfessions = function()
    -- This is where DMP actually adds the new professions.
    -- JavaDoc Reference = http://theindiestone.com/zomboidjavadocs/zombie/characters/professions/ProfessionFactory.Profession.html
    local teacher = ProfessionFactory.addProfession(
        "dmp_teacher",
        "Teacher",
        "profession_teacher",
        6,
        "Once an educator of the masses, now a humble survivor."
    );
    teacher:addXPBoost(Perks.Doctor, 1);
    teacher:addFreeTrait("dpm_KeenHearing");
    local professor = ProfessionFactory.addProfession(
        "dmp_professor",
        "Professor",
        "profession_professor",
        -4,
        "The most pretigous of educator, now bringing your skills to the dying world!"
    );
    professor:addFreeTrait("dpm_Organized");
    professor:addFreeTrait("NightOwl");
    local student = ProfessionFactory.addProfession(
        "dmp_student",
        "Student",
        "profession_student",
        12,
        "From running to class to running from zombies, hope what you learned may help!"
    );
    student:addFreeTrait("dpm_Feeble");
    student:addXPBoost(Perks.Sprinting, 2);
    local librarian = ProfessionFactory.addProfession(
        "dmp_librarian",
        "Librarian",
        "profession_librarian",
        -2,
        "Telling those to be quiet will bode much better during the apocalypse."
    );
    librarian:addFreeTrait("dpm_FastReader");
    librarian:addXPBoost(Perks.Lightfoot, 2);
    local paramedic = ProfessionFactory.addProfession(
        "dmp_paramedic",
        "Paramedic",
        "profession_paramedic",
        -3,
        "First to the scene and to respond. Panicking doesn't come easy, even during these times."
    );
    paramedic:addXPBoost(Perks.Doctor, 2);
    local lifeguard = ProfessionFactory.addProfession(
        "dmp_lifeguard",
        "Lifeguard",
        "profession_lifeguard",
        -4,
        "Guarding life has a new meaning!"
    );
    lifeguard:addXPBoost(Perks.Fitness, 3);
    lifeguard:addXPBoost(Perks.Sprinting, 2);
    lifeguard:addXPBoost(Perks.Doctor, 1);
    local garbageman = ProfessionFactory.addProfession(
        "dmp_garbageman",
        "Garbage Man",
        "profession_garbageman",
        -6,
        "Early mornings, long days."
    );
    garbageman:addFreeTrait("dpm_Stout");
    garbageman:addXPBoost(Perks.Fitness, 2);
    garbageman:addXPBoost(Perks.Sprinting, 1);
    local soldier = ProfessionFactory.addProfession(
        "dmp_soldier",
        "Soldier",
        "profession_veteran2",
        -10,
        "Gone AWOL."
    );
    soldier:addXPBoost(Perks.Doctor, 1);
    soldier:addXPBoost(Perks.Sprinting, 2);
    soldier:addXPBoost(Perks.Aiming, 3);
    soldier:addXPBoost(Perks.Reloading, 2);
    soldier:addXPBoost(Perks.Fitness, 3);
    soldier:addXPBoost(Perks.Strength, 2);
    local waiter = ProfessionFactory.addProfession(
        "dmp_waiter",
        "Waiter",
        "profession_chef2",
        4,
        "Jumping from the frying pan into the fire."
    );
    waiter:addXPBoost(Perks.Nimble, 2);
    waiter:addXPBoost(Perks.BladeMaintenance, 1);
    local actor = ProfessionFactory.addProfession(
        "dmp_actor",
        "Actor",
        "profession_actor",
        4,
        "Now Playing: Survival."
    );
    actor:addXPBoost(Perks.Nimble, 2);
    actor:addXPBoost(Perks.Lightfoot, 1);
    actor:addXPBoost(Perks.Fitness, 2);
    local pilot = ProfessionFactory.addProfession(
        "dmp_pilot",
        "Pilot",
        "profession_pilot",
        -6,
        "With all flights being delayed, surviving is the only option left."
    );
    pilot:addFreeTrait("dpm_EagleEyed");
    pilot:addFreeTrait("NightOwl");
    local botanist = ProfessionFactory.addProfession(
        "dmp_botanist",
        "Botanist",
        "profession_botanist",
        -4,
        "At least plants aren't trying to eat people."
    );
    botanist:addXPBoost(Perks.Farming, 2);
    botanist:addXPBoost(Perks.PlantScavenging, 1);
    --[[local meteorologist = ProfessionFactory.addProfession(
        "dmp_meteorologist",
        "Meteorologist",
        "",
        4,
        "Waether predictions come easy to you."
    );
    local radiodj = ProfessionFactory.addProfession(
        "dmp_radiodj",
        "Radio DJ",
        "",
        4,
        "Finding the right signal is all that really matters."
    );]]
    local referee = ProfessionFactory.addProfession(
        "dmp_referee",
        "Referee",
        "profession_referee",
        -6,
        "Publicly hated but physically toned!"
    );
    referee:addFreeTrait("dpm_Outdoorsman");
    referee:addXPBoost(Perks.Fitness, 2);
    referee:addXPBoost(Perks.Sprinting, 2);
    local offshoreworker = ProfessionFactory.addProfession(
        "dmp_offshoreworker",
        "Offshore Worker",
        "profession_constructionworker2",
        -8,
        "Welcome back to land! Things are a little different."
    );
    offshoreworker:addFreeTrait("dpm_Strong");
    offshoreworker:getFreeRecipes():add("Generator");
    offshoreworker:addXPBoost(Perks.Strength, 2);
    offshoreworker:addXPBoost(Perks.Electricity, 3);
    offshoreworker:addXPBoost(Perks.Woodwork, 2);
    local surgeon = ProfessionFactory.addProfession(
        "dmp_surgeon",
        "Surgeon",
        "profession_doctor2",
        -6,
        "Percision cuts can make difference. Both in the OR and zombie infested world."
    );
    surgeon:addXPBoost(Perks.Doctor, 2);
    surgeon:addXPBoost(Perks.BladeMaintenance, 2);
    surgeon:addXPBoost(Perks.BladeMaintenance, 2);
    local zookeeper = ProfessionFactory.addProfession(
        "dmp_zookeeper",
        "Zookeeper",
        "profession_parkranger2",
        -6,
        "Zombies, animals, same thing! Right?"
    );
    zookeeper:addXPBoost(Perks.Aiming, 2);
    zookeeper:addXPBoost(Perks.PlantScavenging, 2);
    zookeeper:addXPBoost(Perks.Farming, 1);
    zookeeper:addXPBoost(Perks.Fitness, 1);
    local paparazzi = ProfessionFactory.addProfession(
        "dmp_paparazzi",
        "Paparazzi",
        "profession_paparazzi",
        5,
        "Sleazy tactics and sneaking around late at night to get the perfect shot."
    );
    paparazzi:addFreeTrait("dpm_Cowardly");
    paparazzi:addXPBoost(Perks.Sneak, 3);
    paparazzi:addXPBoost(Perks.Lightfoot, 2);
    local professionathlete = ProfessionFactory.addProfession(
        "dmp_professionalathlete",
        "Professional Athlete",
        "profession_athlete",
        -12,
        "You've spent your entire life training for this."
    );
    professionathlete:addFreeTrait("dpm_Outdoorsman");
    professionathlete:addXPBoost(Perks.Sprinting, 4);
    professionathlete:addXPBoost(Perks.Strength, 4);
    professionathlete:addXPBoost(Perks.Fitness, 4);
end

Events.OnGameBoot.Add(DPMProfessions.DoTraits);
Events.OnGameBoot.Add(DPMProfessions.DoProfessions);