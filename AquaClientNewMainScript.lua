run(function()
        local InfiniteJump: table = {["Enabled"] = false}
    InfiniteJump= vape.Categories.Blatant:CreateModule({
        ["Name"] = "InfiniteJump",
            ["HoverText"] = "Let's you jump in the air.",
        ["Function"] = function(callback: boolean): void
            if callback then
                local connection: any = inputService["JumpRequest"]:Connect(function()
                    lplr["Character"]["Humanoid"]:ChangeState("Jumping");
                end);
                        InfiniteJump["Connection"] = connection;
            else
                        if InfiniteJump["Connection"] then
                            InfiniteJump["Connection"]:Disconnect();
                            InfiniteJump["Connection"] = nil;
                        end;
            end;
        end,
    })
end)

run(function()
    local ShaderToggle

    ShaderToggle = vape.Categories.Render:CreateModule({
        Name = "RealisticShader",
        Function = function(enabled)
            local lighting = game:GetService("Lighting")
            local bloom = lighting:FindFirstChild("Bloom")
            local colorCorrection = lighting:FindFirstChild("ColorCorrection")

            if enabled then
                -- Enable shader effects
                if bloom then bloom.Enabled = true end
                if colorCorrection then colorCorrection.Enabled = true end
            else
                -- Disable shader effects
                if bloom then bloom.Enabled = false end
                if colorCorrection then colorCorrection.Enabled = false end
            end
        end,
        Tooltip = "Toggle realistic shader effects (Bloom + ColorCorrection)"
    })
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()\
