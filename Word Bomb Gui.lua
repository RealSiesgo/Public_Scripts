-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UICorner_2 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIGradient_2 = Instance.new("UIGradient")
local Frame_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(115, 255, 0)
MainFrame.Position = UDim2.new(0, 0, 0.733333349, 0)
MainFrame.Size = UDim2.new(0, 100, 0, 50)
MainFrame.ZIndex = 91

TextButton.Parent = MainFrame
TextButton.BackgroundColor3 = Color3.fromRGB(89, 227, 2)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0.129999995, 0, 0.243333131, 0)
TextButton.Size = UDim2.new(0, 74, 0, 25)
TextButton.ZIndex = 99999
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Auto Type Word"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextStrokeTransparency = 0.800
TextButton.TextWrapped = true

UICorner.Parent = TextButton

UIGradient.Rotation = 307
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.14, 0.90), NumberSequenceKeypoint.new(0.28, 0.98), NumberSequenceKeypoint.new(0.49, 0.70), NumberSequenceKeypoint.new(0.93, 0.90), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient.Parent = MainFrame

UICorner_2.Parent = MainFrame

Frame.Parent = MainFrame
Frame.BackgroundColor3 = Color3.fromRGB(89, 227, 2)
Frame.BackgroundTransparency = 0.200
Frame.Position = UDim2.new(0.129999995, 0, 0.243000001, 0)
Frame.Size = UDim2.new(0, 74, 0, 25)

UICorner_3.Parent = Frame

UIGradient_2.Rotation = 307
UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.56), NumberSequenceKeypoint.new(0.14, 0.16), NumberSequenceKeypoint.new(0.27, 0.00), NumberSequenceKeypoint.new(0.69, 0.48), NumberSequenceKeypoint.new(0.82, 0.00), NumberSequenceKeypoint.new(1.00, 0.52)}
UIGradient_2.Parent = Frame

Frame_2.Parent = ScreenGui
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 108, 66)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.73299998, 0)
Frame_2.Size = UDim2.new(0, 100, 0, 50)
Frame_2.ZIndex = 90

UICorner_4.Parent = Frame_2

-- Scripts:

local function OQVAUDX_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	function GUESSER()
		string_len_max=5
		--the script may increase max length 1 by 1 if theres no words for the hint matching the max length
	
		math.randomseed(os.time())
	
		local MATH_RANDOM_MIN,MATH_RANDOM_MAX=5,17
	
		if not alreadyguessedtable then
			getgenv().alreadyguessedtable={}
		end
		-- /Settings\ --
		-- -- -- -- --
	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/angeld23/raw-text-host/master/condensed_english_words"))()
		table.insert(ENGLISH_WORDS,"pes")table.insert(ENGLISH_WORDS,"des")
		
		center=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Center
		
		HINT=""
		tfrm=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
		TEXTBOX=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox
	
		if center.BackgroundTransparency==1 then return end
		if TEXTBOX.Visible==false then return end
		
		for i,v in next,tfrm:GetChildren() do
			--FIND HINTS
			if v.Name=="LetterFrame" and v.Visible then
				--IF HINTLETTERFRAME AND HINTLETTERFRAME VISIBLE THEN
				HINT=HINT..v.Letter.TextLabel.Text
				--GET THE HINT MSG
			end
		end
		function trytofind(length)
			for i,v in next, ENGLISH_WORDS do
				if v:lower():match(HINT:lower()) and string.len(v)<length and (not table.find(alreadyguessedtable,v)) then
					table.insert(alreadyguessedtable,v)
					for i=1,v:len() do
						wait(math.random(MATH_RANDOM_MIN,MATH_RANDOM_MAX)*10^-2)
						TEXTBOX.Text=v:sub(1,i)
					end
					wait(.25)
					local oldtb=game:GetService("UserInputService"):GetFocusedTextBox()
					
					firesignal(TEXTBOX.FocusLost, true)
					
					if oldtb then oldtb:CaptureFocus() end
					return true
				end
			end
	
			return false
		end
		if trytofind(string_len_max)==false then
			for i=string_len_max,30 do
				if trytofind(i) then break end
			end
		end
	end
	debounce=false
	script.Parent.MouseButton1Click:Connect(function()
		if debounce==false then
			debounce=true
			coroutine.wrap(GUESSER)()
			for i=1,0,-.2 do task.wait()
				script.Parent.BackgroundTransparency=i
			end
			wait(.25)
			for i=0,1,.2 do task.wait()
				script.Parent.BackgroundTransparency=i
			end
			debounce=false
		end
	end)
end
coroutine.wrap(OQVAUDX_fake_script)()
local function WSSG_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(WSSG_fake_script)()
local function WEOHWD_fake_script() -- Frame_2.LocalScript 
	local script = Instance.new('LocalScript', Frame_2)

	script.Parent.Position=script.Parent.Parent.MainFrame.Position
	script.Parent.Parent.MainFrame:GetPropertyChangedSignal("Position"):Connect(function()
		script.Parent.Position=script.Parent.Parent.MainFrame.Position
	end)
end
coroutine.wrap(WEOHWD_fake_script)()
