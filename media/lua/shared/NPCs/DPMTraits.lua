--
-- ${PACKAGE_NAME}
-- User: Tyler
-- Date: 8/9/2016
-- Time: 12:19 AM
--
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
end

Events.OnCreatePlayer.Add(DPMTraits.handleCreation);