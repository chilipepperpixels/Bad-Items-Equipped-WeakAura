function()
    local name = aura_env.itemName
    
    if not name then
        return ""
    end
    
    return string.upper(name) .. " EQUIPPED YOU BUM"
end

