getgenv().Autodrop = false

local FrameObject = game.Players.LocalPlayer
local Open = false

local PositionClosed = UDim2.new(0.35, 0, -1, 0)
local PositionOpen = UDim2.new(0, 35, 0, 0.25, 0)
local UserInputService = game:GetService("UserInputService")

local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua")))()

local w = library:CreateWindow("AutoDrop - Da Hood")

local b = w:CreateFolder("Options") 

b:Toggle(
    "Toggle",
    function(bool)
        getgenv().Autodrop = bool
        if bool == true then
            local args = {
                [1] = "DropMoney",
                [2] = "10000"
            }

            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
            wait(0.5)
        end
    end
)

UserInputService.InputBegan:connect(
    function(keyCode)
        if keyCode.keyCode == Enum.KeyCode.V then
            if Open then
                Frame = Object:TweenPosition(PositionClosed)
                Open = false
            else
                Open = true
                Frame:TweenPosition(PositionOpen)
            end
        end
    end
)
