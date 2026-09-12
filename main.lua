-- =========================================================================
-- ECLIPSE HUB UI SCRIPT
-- =========================================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =========================================================================
-- CONFIGURATION
-- =========================================================================
local KEY_TO_CHECK = "ECLIPSE-2024" -- <--- MODIFY THIS TO YOUR ACTUAL VALID KEY
local LINK_TO_COPY = "getkeyeclipse.netlify.app"

-- =========================================================================
-- UI CREATION
-- =========================================================================

-- 1. ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EclipseHubUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- 2. Main Frame (Centered)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 400)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = false -- Prevents dragging/clicking through
mainFrame.Parent = screenGui

-- Main Frame Corner Radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Main Frame Border (Purple Glow)
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 70, 150)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

-- Drop Shadow (Subtle Glow)
local mainShadow = Instance.new("ImageLabel")
mainShadow.Name = "Shadow"
mainShadow.Size = UDim2.new(1, 30, 1, 30)
mainShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
mainShadow.AnchorPoint = Vector2.new(0.5, 0.5)
mainShadow.BackgroundTransparency = 1
mainShadow.Image = "rbxassetid://5028857084" -- Standard shadow asset
mainShadow.ImageColor3 = Color3.fromRGB(80, 40, 150)
mainShadow.ImageTransparency = 0.6
mainShadow.ZIndex = 0
mainShadow.Parent = mainFrame

-- Responsive Scaling (Mobile / PC)
local uiScale = Instance.new("UIScale")
uiScale.Parent = mainFrame

local function updateScale()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    if viewportSize.X < 800 then
        uiScale.Scale = 0.75 -- Mobile scale
    else
        uiScale.Scale = 1.0  -- PC scale
    end
end
updateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)

-- 3. Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -15, 0, 15)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

-- 4. Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 25)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "ECLIPSE HUB"
titleLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
titleLabel.TextSize = 32
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- 5. Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Name = "Subtitle"
subtitleLabel.Size = UDim2.new(1, 0, 0, 20)
subtitleLabel.Position = UDim2.new(0, 0, 0, 65)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "made by NovaDev"
subtitleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitleLabel.TextSize = 14
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.Parent = mainFrame

-- 6. Divider Line
local divider = Instance.new("Frame")
divider.Name = "Divider"
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.new(0, 20, 0, 95)
divider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- 7. Center Image / Logo
local logoImage = Instance.new("ImageLabel")
logoImage.Name = "Logo"
logoImage.Size = UDim2.new(0, 100, 0, 100)
logoImage.Position = UDim2.new(0.5, 0, 0, 110)
logoImage.AnchorPoint = Vector2.new(0.5, 0)
logoImage.BackgroundTransparency = 1
-- =========================================================================
-- REPLACE THE ASSET ID BELOW WITH YOUR OWN IMAGE
-- =========================================================================
logoImage.Image = "rbxassetid://123456789" -- <--- CHANGE THIS TO YOUR IMAGE ASSET ID
-- =========================================================================
logoImage.Parent = mainFrame

-- 8. Key Input Box
local inputBox = Instance.new("TextBox")
inputBox.Name = "InputBox"
inputBox.Size = UDim2.new(1, -40, 0, 45)
inputBox.Position = UDim2.new(0, 20, 0, 225)
inputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
inputBox.TextColor3 = Color3.fromRGB(220, 220, 220)
inputBox.PlaceholderText = "Enter your key..."
inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
inputBox.TextSize = 16
inputBox.Font = Enum.Font.Gotham
inputBox.Text = ""
inputBox.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputBox

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(60, 60, 70)
inputStroke.Thickness = 1
inputStroke.Parent = inputBox

-- 9. Buttons Container
local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, -40, 0, 45)
buttonContainer.Position = UDim2.new(0, 20, 0, 285)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- CHECK KEY Button
local checkKeyBtn = Instance.new("TextButton")
checkKeyBtn.Name = "CheckKeyButton"
checkKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
checkKeyBtn.Position = UDim2.new(0, 0, 0, 0)
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(120, 80, 200) -- Purple
checkKeyBtn.Text = "CHECK KEY"
checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyBtn.TextSize = 16
checkKeyBtn.Font = Enum.Font.GothamBold
checkKeyBtn.Parent = buttonContainer

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 8)
checkCorner.Parent = checkKeyBtn

-- COPY LINK Button
local copyLinkBtn = Instance.new("TextButton")
copyLinkBtn.Name = "CopyLinkButton"
copyLinkBtn.Size = UDim2.new(0.48, 0, 1, 0)
copyLinkBtn.Position = UDim2.new(0.52, 0, 0, 0)
copyLinkBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45) -- Dark Gray
copyLinkBtn.Text = "COPY LINK"
copyLinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkBtn.TextSize = 16
copyLinkBtn.Font = Enum.Font.GothamBold
copyLinkBtn.Parent = buttonContainer

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 8)
copyCorner.Parent = copyLinkBtn

-- 10. Notification / Status Label (Green success message)
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 350)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(80, 200, 80) -- Green
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

-- =========================================================================
-- LOGIC & FUNCTIONALITY
-- =========================================================================

-- Function to copy text to clipboard
local function copyToClipboard(text)
    -- setclipboard is not available in standard Roblox games, but works in Studio or Executors.
    -- We use a pcall to prevent the script from breaking if it's not available.
    if setclipboard then
        pcall(setclipboard, text)
        return true
    else
        return false
    end
end

-- Function to check the entered key
-- =========================================================================
-- REPLACE THIS LOGIC WITH YOUR OWN KEY CHECKING FUNCTION
-- =========================================================================
local function checkKeyFunction(key)
    -- Example logic: Check if the key matches a specific string
    if key == KEY_TO_CHECK then
        return true, "Key is valid! Welcome."
    elseif key == "" then
        return false, "Please enter a key."
    else
        return false, "Invalid key. Please try again."
    end
end

-- Update status label
local function showStatus(message, isSuccess)
    statusLabel.Text = message
    if isSuccess then
        statusLabel.TextColor3 = Color3.fromRGB(80, 200, 80) -- Green
    else
        statusLabel.TextColor3 = Color3.fromRGB(200, 80, 80) -- Red
    end
    
    -- Automatically clear the message after 3 seconds
    task.delay(3, function()
        statusLabel.Text = ""
    end)
end

-- Button Connections
copyLinkBtn.MouseButton1Click:Connect(function()
    local success = copyToClipboard(LINK_TO_COPY)
    if success then
        showStatus("Link copied to clipboard!", true)
    else
        -- Fallback if setclipboard is not supported
        showStatus("Clipboard not supported! Link: " .. LINK_TO_COPY, false)
    end
end)

checkKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = inputBox.Text
    local isValid, message = checkKeyFunction(enteredKey)
    
    if isValid then
        showStatus(message, true)
        -- Add any extra logic for a valid key here (e.g., unlock features)
    else
        showStatus(message, false)
    end
end)

-- =========================================================================
-- END OF SCRIPT
-- =========================================================================
