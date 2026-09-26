local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

local Window = WindUI:CreateWindow({
    Title = "服务器功能",
    Icon = "sparkles",
    Author = "XJW",
    Folder = "XJWCenter",
    Size = UDim2.fromOffset(420, 480),
    Theme = "Light",
    HideSearchBar = false,
})

local ClockTag = Window:Tag({
    Title = os.date("%H:%M"),
    Color = Color3.fromRGB(255, 255, 255)
})

task.spawn(function()
    while true do
        task.wait(15)
        if Window.Destroyed then break end
        pcall(function()
            ClockTag:SetTitle(os.date("%H:%M"))
            ClockTag:SetColor(Color3.fromRGB(255, 255, 255))
        end)
    end
end)

Window:Tag({
    Title = "服务器功能",
    Color = Color3.fromRGB(255, 255, 255)
})

Window:EditOpenButton({
    Title = "服务器功能",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
    Draggable = true,
})

local function loadGame(name, url)
    WindUI:Notify({ Title = "正在加载", Content = name, Duration = 3 })
    task.spawn(function()
        local ok, content = pcall(function()
            return game:HttpGet(url)
        end)
        if not ok or not content or #content == 0 then
            WindUI:Notify({ Title = "加载失败", Content = name .. " 下载失败", Duration = 5 })
            return
        end
        local fn, compileErr = loadstring(content)
        if not fn then
            WindUI:Notify({ Title = "编译失败", Content = tostring(compileErr), Duration = 5 })
            return
        end
        local runOk, runErr = pcall(fn)
        if not runOk then
            WindUI:Notify({ Title = "运行出错", Content = tostring(runErr), Duration = 5 })
        end
    end)
end

local function makeTab(title, icon)
    local ok, tab = pcall(function()
        return Window:Tab({ Title = title, Icon = icon, Locked = false })
    end)
    if ok and tab then return tab end
    local ok2, tab2 = pcall(function()
        return Window:Tab({ Title = title, Locked = false })
    end)
    if ok2 then return tab2 end
    return nil
end




local GAMES = {
    {
        Name = "寻找针头",
        Icon = "compass",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E5%AF%BB%E6%89%BE%E9%92%88%E5%A4%B4.lua",
        PlaceId = "108628039999641",
        GameId = "10756011174",
        Keys = { "Needle In A Haystack", "Needle", "Haystack" },
    },
    {
        Name = "力量传奇（安脚本）",
        Icon = "dumbbell",
        Url = "https://raw.githubusercontent.com/Anscripterato/QQ2134702438/refs/heads/main/byato/AnScript/atoscript",
        PlaceId = "3623096087",
        GameId = "1268927906",
        Keys = { "Muscle Legends", "Muscle" },
    },
    {
        Name = "极速传奇",
        Icon = "rocket",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/XJW%E6%9E%81%E9%80%9F%E4%BC%A0%E5%A5%87.lua",
        PlaceId = "3101667897",
        GameId = "1119466531",
        Keys = { "Legends of Speed" },
    },
    {
        Name = "建造一架飞机",
        Icon = "plane",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E5%BB%BA%E9%80%A0%E4%B8%80%E4%B8%AA%E9%A3%9E%E6%9C%BA.lua",
        PlaceId = "137925884276740",
        GameId = "7822444776",
        Keys = { "Build A Plane", "Build a Plane" },
    },
    {
        Name = "[FPS]一键点击",
        Icon = "mouse-pointer-click",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/FPS%E4%B8%80%E9%94%AE%E7%94%B5%E5%87%BB.lua",
        PlaceId = "90568084448279",
        GameId = "9294074907",
        Keys = { "One Tap" },
    },
    {
        Name = "捕捉10亿只鸭子",
        Icon = "target",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E6%8D%95%E6%8D%8910%E4%BA%BF%E5%8F%AA%E9%B8%AD%E5%AD%90.lua",
        PlaceId = "100293509865504",
        GameId = "10516888336",
        Keys = { "1 Billion Ducks", "Billion Ducks", "Duck" },
    },
    {
        Name = "清理所有枫叶",
        Icon = "leaf",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E6%B8%85%E7%90%86%E6%89%80%E4%BB%A5%E6%9E%AB%E5%8F%B6.lua",
        PlaceId = "92637789841354",
        GameId = "10539411000",
        Keys = { "Clean All The Leaves", "Clean All the Leaves", "Leaves", "Leaf" },
    },
    {
        Name = "逃跑者",
        Icon = "footprints",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E9%80%83%E8%B7%91%E8%80%85.lua",
        PlaceId = "118418618261207",
        GameId = "7585140258",
        Keys = { "逃跑者", "Runaways", "Runaway" },
    },
    {
        Name = "钻探至地球核心",
        Icon = "pickaxe",
        Url = "https://raw.githubusercontent.com/jiuyijiuyijiuyi91/78789191/refs/heads/main/%E9%92%BB%E6%8E%A2%E8%87%B3%E5%9C%B0%E7%90%83%E6%A0%B8%E5%BF%83.lua",
        PlaceId = "101906032112547",
        GameId = "9796898051",
        Keys = { "Drill to Earth's Core", "Drill to Earth s Core", "Drill", "Earth's Core" },
    },
}


local liveCache = { placeId = nil, productName = nil }
local function getLiveInfo()
    local placeId, gameId, mapName = "?", "?", "?"
    pcall(function() placeId = tostring(game.PlaceId) end)
    pcall(function() gameId = tostring(game.GameId) end)
    pcall(function() mapName = tostring(game.Name or "?") end)
    if gameId == "" or gameId == "0" then gameId = "不可用" end

    if liveCache.placeId ~= placeId then
        liveCache.placeId = placeId
        liveCache.productName = nil
        pcall(function()
            local info = game:GetService("MarketplaceService"):GetProductInfo(tonumber(placeId))
            if info and info.Name then
                liveCache.productName = tostring(info.Name)
            end
        end)
    end
    return placeId, gameId, mapName, (liveCache.productName or "-")
end

local function detectGame()
    local placeId, gameId, mapName, productName = getLiveInfo()

    
    if gameId ~= "不可用" and gameId ~= "?" then
        for _, g in ipairs(GAMES) do
            if g.GameId and g.GameId ~= "" and g.GameId == gameId then
                return g, "GameId 匹配"
            end
        end
    end

    
    for _, g in ipairs(GAMES) do
        if g.PlaceId and g.PlaceId ~= "" and g.PlaceId == placeId then
            return g, "PlaceId 匹配"
        end
    end

    
    local names = { string.lower(mapName), string.lower(productName) }
    for _, g in ipairs(GAMES) do
        for _, k in ipairs(g.Keys or {}) do
            local key = string.lower(k)
            for _, n in ipairs(names) do
                if n and n ~= "" and n ~= "-" and string.find(n, key, 1, true) then
                    return g, "名称匹配(" .. k .. ")"
                end
            end
        end
    end
    return nil, "未匹配"
end

task.spawn(function()
    local tab = makeTab("当前服务器", "server")
    if tab then
        tab:Section({ Title = "识别状态", TextXAlignment = "Left", TextSize = 17 })

        local paraResult
        local ok1, p1 = pcall(function()
            return tab:Paragraph({ Title = "识别结果", Desc = "检测中..." })
        end)
        if ok1 then paraResult = p1 end

        local paraId
        local ok2, p2 = pcall(function()
            return tab:Paragraph({ Title = "服务器ID", Desc = "读取中..." })
        end)
        if ok2 then paraId = p2 end

        local lastResultText = nil

        local function refresh(silent)
            local g = detectGame()

            local placeId, gameId, mapName, productName = getLiveInfo()
            if paraId then
                pcall(function()
                    paraId:SetDesc("PlaceId: " .. placeId .. "\nGameId: " .. gameId .. "\n地图名: " .. mapName .. "\n游戏名: " .. productName)
                end)
            end

            local resultText
            if g then
                resultText = "已识别：" .. g.Name
            else
                resultText = "未识别到当前服务器"
            end
            if paraResult then pcall(function() paraResult:SetDesc(resultText) end) end

            
            if silent and resultText ~= lastResultText then
                if g then
                    WindUI:Notify({ Title = "检测到当前游戏", Content = g.Name .. "，可点「加载当前服务器」", Duration = 4 })
                end
            end
            lastResultText = resultText
            return g
        end

        refresh(false)

        
        tab:Button({
            Title = "重新识别",
            Callback = function()
                task.spawn(function()
                    refresh(false)
                end)
            end,
        })

        tab:Button({
            Title = "加载当前服务器",
            Callback = function()
                task.spawn(function()
                    local g = refresh(false)
                    if g then
                        WindUI:Notify({ Title = "已识别当前服务器", Content = g.Name, Duration = 3 })
                        loadGame(g.Name, g.Url)
                    else
                        WindUI:Notify({ Title = "未识别到当前服务器", Content = "当前服务器不在支持列表内", Duration = 5 })
                    end
                end)
            end,
        })
    end

    for _, g in ipairs(GAMES) do
        local gtab = makeTab(g.Name, g.Icon)
        if gtab then
            gtab:Section({ Title = "游戏脚本", TextXAlignment = "Left", TextSize = 17 })
            gtab:Button({
                Title = g.Name,
                Callback = function()
                    loadGame(g.Name, g.Url)
                end,
            })
        end
    end
end)
