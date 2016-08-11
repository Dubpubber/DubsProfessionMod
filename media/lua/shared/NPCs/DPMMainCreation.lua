--
-- ${PACKAGE_NAME}
-- User: Tyler
-- Date: 8/9/2016
-- Time: 12:19 AM
--
SeedPacks = {
    "farming.BroccoliBagSeed",
    "farming.CabbageBagSeed",
    "farming.CarrotBagSeed",
    "farming.PotatoBagSeed",
    "farming.RedRadishBagSeed",
    "farming.StrewberrieBagSeed",
    "farming.TomatoBagSeed"
}
SkillBooks = {
    "Base.BookCarpentry1",
    "Base.BookCarpentry2",
    "Base.BookCarpentry3",
    "Base.BookCooking1",
    "Base.BookCooking2",
    "Base.BookCooking3",
    "Base.BookFarming1",
    "Base.BookFarming2",
    "Base.BookFarming3",
    "Base.BookFishing1",
    "Base.BookFishing2",
    "Base.BookFishing3",
    "Base.BookTrapping1",
    "Base.BookTrapping2",
    "Base.BookTrapping3"
}
HighLevelSkillBooks = {
    "Base.BookCarpentry4",
    "Base.BookCarpentry5",
    "Base.BookCooking4",
    "Base.BookCooking5",
    "Base.BookFarming4",
    "Base.BookFarming5",
    "Base.BookFishing4",
    "Base.BookFishing5",
    "Base.BookTrapping4",
    "Base.BookTrapping5",
}
function getRandomStringFromTable(table)
    local count = 0;
    for _ in pairs(table) do count = count + 1 end
    return table[ZombRand(count)];
end

function insertIntoContainer(container, item, amount, random)
    if container == nil then
        return;
    end
    if random then
        for i = 1, ZombRand(amount) do
            container:AddItem(item);
        end
        -- unused variable = i;
    else
        for i = 1, amount do
            container:AddItem(item);
        end
        -- unused variable = i;
    end
end

DPMTraits = {}
DPMTraits.handleCreation = function(player)
    if player == nil then
        return;
    end
    -- Automatically finds all dpm traits and replaces them with the correct counterpart.
    -- More efficent and because I'm incredibly lazy.
    local playerTraits = getPlayer():getTraits();
    for i = 1, playerTraits:size() do
        local trait = playerTraits:get(i - 1);
        if trait ~= nil and trait:contains("dpm_") then
            getPlayer():getTraits():remove(trait);
            trait = string.sub(trait, 5);
            getPlayer():getTraits():add(trait);
        end
    end
    -- You have no idea how hard this was to find...
    local profession = getPlayer():getDescriptor():getProfession();
    -- Sucks that Lua doesn't support switch statements... yes, yes, I'm aware of the table method.
    if profession ~= nil and SandboxVars.StarterKit then
        print("DPM detected that the starter kit was enabled, player's will now have a generated kit along with thier associated profession.");
        print("Loading inventory for " .. profession);
        if profession == "dmp_priest" then
            -- Let's see if the player's realize how OP this shit is!
            local dmp_priest_book = getPlayer():getInventory():AddItem("Base.Book");
            dmp_priest_book:setName("The Holy Bible");
            dmp_priest_book:setDisappearOnUse(false);
        end
        if profession == "dmp_paramedic" or profession == "doctor" or profession == "dmp_lifeguard" or profession == "nurse" then
            getPlayer():getInventory():AddItem("Base.FirstAidKit");
        end
        if profession == "dmp_student" then
            local backpack = getPlayer():getInventory():AddItem("Base.Schoolbag");
            backpack:getItemContainer():AddItem("Base.Book"):setName("Organic Chemistry");
            backpack:getItemContainer():AddItem("Base.Book"):setName("Advanced Calculus");
            backpack:getItemContainer():AddItem("Base.Book"):setName("American History");
            insertIntoContainer(backpack:getItemContainer(), "Base.Journal", 4, true);
            insertIntoContainer(backpack:getItemContainer(), "Base.Pencil", 3, false);
            insertIntoContainer(backpack:getItemContainer(), "Base.Pen", 2, false);
            backpack:getItemContainer():AddItem("Base.PillsAntiDep");
        end
        if profession == "dmp_garbageman" then
            insertIntoContainer(getPlayer():getInventory(), "Base.Garbagebag", 12, false);
        end
        if profession == "dmp_librarian" or profession == "dpm_teacher" then
            for i = 1, ZombRand(3) do
                insertIntoContainer(getPlayer():getInventory(), getRandomStringFromTable(SkillBooks), 1, false);
            end
            -- unused variable = i;
        end
        if profession == "dpm_professor" then
            for i = 1, ZombRand(2) do
                insertIntoContainer(getPlayer():getInventory(), getRandomStringFromTable(HighLevelSkillBooks), 1, false);
            end
            -- unused variable = i;
        end
        if profession == "dmp_waiter" then
            insertIntoContainer(bigBag:getItemContainer(), "Base.DishCloth", 2, false);
            getPlayer():getInventory():AddItem("Base.KitchenKnife");
        end
        if profession == "dmp_soldier" then
            insertIntoContainer(getPlayer():getInventory(), "Base.BulletsBox", 3, true);
            getPlayer():getInventory():AddItem("Base.Pistol"):setCondition(7);
            getPlayer():getInventory():AddItem("Base.WalkieTalkie5");
        end
        if profession == "farmer" or profession == "dmp_botanist" then
            for i = 1, ZombRand(12) do
                insertIntoContainer(getPlayer():getInventory(), getRandomStringFromTable(SeedPacks), 2, false);
            end
            -- unused variable = i;
        end
        if profession == "dmp_entrepreneur" then
            local bigBag = getPlayer():getInventory():AddItem("Base.BigHikingBag");
            local selectedTrade = ZombRand(6);
            -- 0: Hardware
            -- 1: Medicine
            -- 2: Farming
            -- 3: Electronics
            -- 4: Weapons
            -- 5: Food
            if selectedTrade == 0 then
                insertIntoContainer(bigBag:getItemContainer(), "Base.Hammer", 2, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.NailsBox", 3, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.ScrewsBox", 2, false);
                bigBag:getItemContainer():AddItem("Base.Screwdriver");
                bigBag:getItemContainer():AddItem("Base.Saw");
                bigBag:getItemContainer():AddItem("Base.BucketEmpty");
                if ZombRand(1) == 0 then
                    getPlayer():getInventory():AddItem("Base.Axe");
                end
                if ZombRand(4) == 0 then
                    -- Dat RNG tho!
                    getPlayer():getInventory():AddItem("Base.Sledgehammer");
                end
            elseif selectedTrade == 1 then
                insertIntoContainer(bigBag:getItemContainer(), "Base.Bandage", 8, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.PillsBeta", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.PillsAntiDep", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.AlcoholWipes", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.AlcoholedCottonBalls", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.Pills", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.PillsVitamins", 3, true);
                bigBag:getItemContainer():AddItem("Base.Disinfectant");
                bigBag:getItemContainer():AddItem("Base.SutureNeedle");
                bigBag:getItemContainer():AddItem("Base.SutureNeedleHolder");
                bigBag:getItemContainer():AddItem("Base.Tweezers");
            elseif selectedTrade == 2 then
                for i = 1, ZombRand(16) do
                    insertIntoContainer(bigBag:getItemContainer(), getRandomStringFromTable(SeedPacks), 2, false);
                end
                bigBag:getItemContainer():AddItem("Base.Shovel");
                bigBag:getItemContainer():AddItem("Base.HandShovel");
                bigBag:getItemContainer():AddItem("Base.WateredCan");
                -- unused variable = i;
            elseif selectedTrade == 3 then
                insertIntoContainer(bigBag:getItemContainer(), "Base.CDplayer", 4, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.CordlessPhone", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.DigitalWatch", 6, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.Headphones", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.HomeAlarm", 2, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.Speaker", 4, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.Radio", 3, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.Remote", 5, true);
                insertIntoContainer(bigBag:getItemContainer(), "Base.VideoGame", 2, true);
            elseif selectedTrade == 4 then
                bigBag:getItemContainer():AddItem("Base.Pistol");
                insertIntoContainer(bigBag:getItemContainer(), "Base.BulletsBox", 3, true);
                if ZombRand(3) == 0 then
                    getPlayer():getInventory():AddItem("Base.Shotgun");
                    getPlayer():getInventory():AddItem("Base.AmmoStraps");
                    insertIntoContainer(getPlayer():getInventory(), "Base.ShotgunShellsBox", 3, true);
                end
            else
                getPlayer():getInventory():AddItem("Base.TinOpener");
                insertIntoContainer(bigBag:getItemContainer(), "Base.TinnedBeans", 6, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.CannedCarrots2", 4, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.CannedCornedBeef", 2, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.TinnedSoup", 2, false);
                insertIntoContainer(bigBag:getItemContainer(), "Base.PeanutButter", 3, false);
            end
        end
    end
end

Events.OnCreatePlayer.Add(DPMTraits.handleCreation);