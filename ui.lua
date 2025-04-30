--// nop: this is my test ui but rebradned to essence //--

local HiddenUIContainer = cloneref( gethui() );

local _game = cloneref(game);
local _GetService = clonefunction(_game.GetService);
local function safe_service(name)
        return cloneref( _GetService(_game, name) );
end

local _dtc_ = { };
do
        setreadonly(dtc, false);
        local function copy_func(v)
			if not dtc[v] then
				warn("UI INIT: dtc["..v.."] is nil");
				_dtc_[v] = function()
					warn("UI INIT: dtc["..v.."] is nil");
				end
				return;
			end

            _dtc_[v] = clonefunction( dtc[v] );
            dtc[v] = nil;
        end
        
        copy_func("schedule");
        copy_func("pushautoexec");
                
        copy_func("readscript");
        copy_func("writescript");
        copy_func("isfilescript");
        copy_func("delfilescript");
        copy_func("listscripts");

        copy_func("readautoexe");
        copy_func("create_autoexe");
        copy_func("isfileautoexe");
        copy_func("delfileautoexe");
        copy_func("listautoexe");
        
        setreadonly(dtc, true);
end

-- // temp fix while im not home
do
     local org;
     org = hookfunction(request, function(req)
         if type(req) ~= "table" then
             return org(req); -- will error for us
         end
 
         if type(req["Headers"]) == "table" and req["Headers"]["User-Agent"] ~= nil then
             return org(req); -- ua set by script, like eclipse
         end
 
         local headers = req["Headers"];
         if type(req["Headers"]) ~= "table" then
             headers = { };
         end
 
         headers["User-Agent"] = "Essence Android 0.3";
         req["Headers"] = headers;
         return org(req);
     end);
end

local Instances = {
    PhantomTest = Instance.new("ScreenGui"),
    mainframe = Instance.new("Frame"),
    title = Instance.new("TextLabel"),
    ScrollingFrame = Instance.new("ScrollingFrame"),
    TextBox = Instance.new("TextBox"),
    exec = Instance.new("TextButton"),
    clr = Instance.new("TextButton"),
    cpy = Instance.new("TextButton"),
    paste = Instance.new("TextButton"),
}

Instances.PhantomTest.Name = "DtcTest"
Instances.PhantomTest.IgnoreGuiInset = false
Instances.PhantomTest.DisplayOrder = 0
Instances.PhantomTest.Parent = HiddenUIContainer
--Instances.PhantomTest.Parent = game.CoreGui

Instances.mainframe.Name = "mainframe"
Instances.mainframe.NextSelectionLeft = nil
Instances.mainframe.Active = false
Instances.mainframe.Selectable = false
Instances.mainframe.AnchorPoint = Vector2.new(0, 0)
Instances.mainframe.NextSelectionRight = nil
Instances.mainframe.ZIndex = 1
Instances.mainframe.AutomaticSize = Enum.AutomaticSize.None
Instances.mainframe.Size = UDim2.new(0, 340, 0, 252)
Instances.mainframe.Visible = true
Instances.mainframe.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.mainframe.NextSelectionDown = nil
Instances.mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.mainframe.SelectionOrder = 0
Instances.mainframe.SelectionImageObject = nil
Instances.mainframe.LayoutOrder = 0
Instances.mainframe.Rotation = 0
Instances.mainframe.ClipsDescendants = false
Instances.mainframe.BackgroundTransparency = 0
Instances.mainframe.Position = UDim2.new(0.197508901, 0, 0.240740746, 0)
Instances.mainframe.BorderMode = Enum.BorderMode.Outline
Instances.mainframe.NextSelectionUp = nil
Instances.mainframe.BorderSizePixel = 0
Instances.mainframe.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Instances.mainframe.Style = Enum.FrameStyle.Custom
Instances.mainframe.Parent = Instances.PhantomTest

Instances.title.Name = "title"
Instances.title.NextSelectionLeft = nil
Instances.title.Active = false
Instances.title.Selectable = false
Instances.title.AnchorPoint = Vector2.new(0, 0)
Instances.title.NextSelectionRight = nil
Instances.title.ZIndex = 1
Instances.title.AutomaticSize = Enum.AutomaticSize.None
Instances.title.Size = UDim2.new(0, 340, 0, 25)
Instances.title.Visible = true
Instances.title.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.title.NextSelectionDown = nil
Instances.title.BorderColor3 = Color3.fromRGB(243, 243, 243)
Instances.title.SelectionOrder = 0
Instances.title.SelectionImageObject = nil
Instances.title.LayoutOrder = 0
Instances.title.Rotation = 0
Instances.title.ClipsDescendants = false
Instances.title.BackgroundTransparency = 0
Instances.title.Position = UDim2.new(-0.000711777655, 0, -0.00146974833, 0)
Instances.title.BorderMode = Enum.BorderMode.Outline
Instances.title.NextSelectionUp = nil
Instances.title.BorderSizePixel = 2
Instances.title.BackgroundColor3 = Color3.fromRGB(33, 32, 32)
Instances.title.TextYAlignment = Enum.TextYAlignment.Center
Instances.title.RichText = false
Instances.title.TextDirection = Enum.TextDirection.Auto
Instances.title.TextColor3 = Color3.fromRGB(255, 255, 255)
Instances.title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.title.Text = "Essence Android"
Instances.title.TextXAlignment = Enum.TextXAlignment.Center
Instances.title.TextStrokeTransparency = 1
Instances.title.TextWrapped = false
Instances.title.TextSize = 14
Instances.title.TextTransparency = 0
Instances.title.TextTruncate = Enum.TextTruncate.None
Instances.title.FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.title.MaxVisibleGraphemes = -1
Instances.title.TextScaled = false
Instances.title.LineHeight = 1
Instances.title.Parent = Instances.mainframe

Instances.ScrollingFrame.Name = "ScrollingFrame"
Instances.ScrollingFrame.NextSelectionLeft = nil
Instances.ScrollingFrame.Active = true
Instances.ScrollingFrame.Selectable = true
Instances.ScrollingFrame.AnchorPoint = Vector2.new(0, 0)
Instances.ScrollingFrame.NextSelectionRight = nil
Instances.ScrollingFrame.ZIndex = 1
Instances.ScrollingFrame.AutomaticSize = Enum.AutomaticSize.None
Instances.ScrollingFrame.Size = UDim2.new(0, 309, 0, 168)
Instances.ScrollingFrame.Visible = true
Instances.ScrollingFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.ScrollingFrame.NextSelectionDown = nil
Instances.ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.ScrollingFrame.SelectionOrder = 0
Instances.ScrollingFrame.SelectionImageObject = nil
Instances.ScrollingFrame.LayoutOrder = 0
Instances.ScrollingFrame.Rotation = 0
Instances.ScrollingFrame.ClipsDescendants = true
Instances.ScrollingFrame.BackgroundTransparency = 0
Instances.ScrollingFrame.Position = UDim2.new(0.0442432165, 0, 0.132275045, 0)
Instances.ScrollingFrame.BorderMode = Enum.BorderMode.Outline
Instances.ScrollingFrame.NextSelectionUp = nil
Instances.ScrollingFrame.BorderSizePixel = 0
Instances.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instances.ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Instances.ScrollingFrame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
Instances.ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
Instances.ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
Instances.ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None
Instances.ScrollingFrame.ScrollBarThickness = 12
Instances.ScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
Instances.ScrollingFrame.ScrollBarImageTransparency = 0
Instances.ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
Instances.ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.XY
Instances.ScrollingFrame.ScrollingEnabled = true
Instances.ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
Instances.ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None
Instances.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
Instances.ScrollingFrame.Parent = Instances.mainframe

Instances.TextBox.Name = "TextBox"
Instances.TextBox.NextSelectionLeft = nil
Instances.TextBox.Active = true
Instances.TextBox.Selectable = true
Instances.TextBox.AnchorPoint = Vector2.new(0, 0)
Instances.TextBox.NextSelectionRight = nil
Instances.TextBox.ZIndex = 1
Instances.TextBox.AutomaticSize = Enum.AutomaticSize.None
Instances.TextBox.Size = UDim2.new(0, 309, 0, 465)
Instances.TextBox.Visible = true
Instances.TextBox.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.TextBox.NextSelectionDown = nil
Instances.TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TextBox.SelectionOrder = 0
Instances.TextBox.SelectionImageObject = nil
Instances.TextBox.LayoutOrder = 0
Instances.TextBox.Rotation = 0
Instances.TextBox.ClipsDescendants = false
Instances.TextBox.BackgroundTransparency = 0
Instances.TextBox.Position = UDim2.new(-0.00023614087, 0, -1.27156579e-06, 0)
Instances.TextBox.BorderMode = Enum.BorderMode.Outline
Instances.TextBox.NextSelectionUp = nil
Instances.TextBox.BorderSizePixel = 0
Instances.TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instances.TextBox.MultiLine = true
Instances.TextBox.CursorPosition = -1
Instances.TextBox.TextDirection = Enum.TextDirection.Auto
Instances.TextBox.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.TextBox.TextStrokeTransparency = 1
Instances.TextBox.SelectionStart = -1
Instances.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
Instances.TextBox.PlaceholderText = "-- I can handle large scripts!"
Instances.TextBox.TextSize = 14
Instances.TextBox.ShowNativeInput = true
Instances.TextBox.RichText = false
Instances.TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
Instances.TextBox.TextYAlignment = Enum.TextYAlignment.Top
Instances.TextBox.Text = ""
Instances.TextBox.LineHeight = 1
Instances.TextBox.TextWrapped = false
Instances.TextBox.TextTruncate = Enum.TextTruncate.None
Instances.TextBox.TextTransparency = 0
Instances.TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.TextBox.TextXAlignment = Enum.TextXAlignment.Left
Instances.TextBox.TextEditable = true
Instances.TextBox.MaxVisibleGraphemes = -1
Instances.TextBox.TextScaled = false
Instances.TextBox.ClearTextOnFocus = false
Instances.TextBox.Parent = Instances.ScrollingFrame

Instances.exec.Name = "exec"
Instances.exec.NextSelectionLeft = nil
Instances.exec.Active = true
Instances.exec.Selectable = true
Instances.exec.AnchorPoint = Vector2.new(0, 0)
Instances.exec.NextSelectionRight = nil
Instances.exec.ZIndex = 1
Instances.exec.AutomaticSize = Enum.AutomaticSize.None
Instances.exec.Size = UDim2.new(0, 75, 0, 30)
Instances.exec.Visible = true
Instances.exec.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.exec.NextSelectionDown = nil
Instances.exec.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.exec.SelectionOrder = 0
Instances.exec.SelectionImageObject = nil
Instances.exec.LayoutOrder = 0
Instances.exec.Rotation = 0
Instances.exec.ClipsDescendants = false
Instances.exec.BackgroundTransparency = 0
Instances.exec.Position = UDim2.new(0.0441176482, 0, 0.849206328, 0)
Instances.exec.BorderMode = Enum.BorderMode.Outline
Instances.exec.NextSelectionUp = nil
Instances.exec.BorderSizePixel = 0
Instances.exec.BackgroundColor3 = Color3.fromRGB(61, 171, 37)
Instances.exec.Modal = false
Instances.exec.Selected = false
Instances.exec.Style = Enum.ButtonStyle.Custom
Instances.exec.AutoButtonColor = true
Instances.exec.TextYAlignment = Enum.TextYAlignment.Center
Instances.exec.RichText = false
Instances.exec.TextDirection = Enum.TextDirection.Auto
Instances.exec.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.exec.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.exec.Text = "Execute"
Instances.exec.TextXAlignment = Enum.TextXAlignment.Center
Instances.exec.TextStrokeTransparency = 1
Instances.exec.TextWrapped = false
Instances.exec.TextSize = 14
Instances.exec.TextTransparency = 0
Instances.exec.TextTruncate = Enum.TextTruncate.None
Instances.exec.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.exec.MaxVisibleGraphemes = -1
Instances.exec.TextScaled = false
Instances.exec.LineHeight = 1
Instances.exec.Parent = Instances.mainframe

Instances.clr.Name = "clr"
Instances.clr.NextSelectionLeft = nil
Instances.clr.Active = true
Instances.clr.Selectable = true
Instances.clr.AnchorPoint = Vector2.new(0, 0)
Instances.clr.NextSelectionRight = nil
Instances.clr.ZIndex = 1
Instances.clr.AutomaticSize = Enum.AutomaticSize.None
Instances.clr.Size = UDim2.new(0, 75, 0, 30)
Instances.clr.Visible = true
Instances.clr.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.clr.NextSelectionDown = nil
Instances.clr.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.clr.SelectionOrder = 0
Instances.clr.SelectionImageObject = nil
Instances.clr.LayoutOrder = 0
Instances.clr.Rotation = 0
Instances.clr.ClipsDescendants = false
Instances.clr.BackgroundTransparency = 0
Instances.clr.Position = UDim2.new(0.288235307, 0, 0.849206328, 0)
Instances.clr.BorderMode = Enum.BorderMode.Outline
Instances.clr.NextSelectionUp = nil
Instances.clr.BorderSizePixel = 0
Instances.clr.BackgroundColor3 = Color3.fromRGB(171, 43, 4)
Instances.clr.Modal = false
Instances.clr.Selected = false
Instances.clr.Style = Enum.ButtonStyle.Custom
Instances.clr.AutoButtonColor = true
Instances.clr.TextYAlignment = Enum.TextYAlignment.Center
Instances.clr.RichText = false
Instances.clr.TextDirection = Enum.TextDirection.Auto
Instances.clr.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.clr.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.clr.Text = "Clear"
Instances.clr.TextXAlignment = Enum.TextXAlignment.Center
Instances.clr.TextStrokeTransparency = 1
Instances.clr.TextWrapped = false
Instances.clr.TextSize = 14
Instances.clr.TextTransparency = 0
Instances.clr.TextTruncate = Enum.TextTruncate.None
Instances.clr.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.clr.MaxVisibleGraphemes = -1
Instances.clr.TextScaled = false
Instances.clr.LineHeight = 1
Instances.clr.Parent = Instances.mainframe

Instances.cpy.Name = "cpy"
Instances.cpy.NextSelectionLeft = nil
Instances.cpy.Active = true
Instances.cpy.Selectable = true
Instances.cpy.AnchorPoint = Vector2.new(0, 0)
Instances.cpy.NextSelectionRight = nil
Instances.cpy.ZIndex = 1
Instances.cpy.AutomaticSize = Enum.AutomaticSize.None
Instances.cpy.Size = UDim2.new(0, 75, 0, 30)
Instances.cpy.Visible = true
Instances.cpy.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.cpy.NextSelectionDown = nil
Instances.cpy.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.cpy.SelectionOrder = 0
Instances.cpy.SelectionImageObject = nil
Instances.cpy.LayoutOrder = 0
Instances.cpy.Rotation = 0
Instances.cpy.ClipsDescendants = false
Instances.cpy.BackgroundTransparency = 0
Instances.cpy.Position = UDim2.new(0.526470602, 0, 0.849206328, 0)
Instances.cpy.BorderMode = Enum.BorderMode.Outline
Instances.cpy.NextSelectionUp = nil
Instances.cpy.BorderSizePixel = 0
Instances.cpy.BackgroundColor3 = Color3.fromRGB(167, 167, 0)
Instances.cpy.Modal = false
Instances.cpy.Selected = false
Instances.cpy.Style = Enum.ButtonStyle.Custom
Instances.cpy.AutoButtonColor = true
Instances.cpy.TextYAlignment = Enum.TextYAlignment.Center
Instances.cpy.RichText = false
Instances.cpy.TextDirection = Enum.TextDirection.Auto
Instances.cpy.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.cpy.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.cpy.Text = "Copy"
Instances.cpy.TextXAlignment = Enum.TextXAlignment.Center
Instances.cpy.TextStrokeTransparency = 1
Instances.cpy.TextWrapped = false
Instances.cpy.TextSize = 14
Instances.cpy.TextTransparency = 0
Instances.cpy.TextTruncate = Enum.TextTruncate.None
Instances.cpy.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.cpy.MaxVisibleGraphemes = -1
Instances.cpy.TextScaled = false
Instances.cpy.LineHeight = 1
Instances.cpy.Parent = Instances.mainframe

Instances.paste.Name = "paste"
Instances.paste.NextSelectionLeft = nil
Instances.paste.Active = true
Instances.paste.Selectable = true
Instances.paste.AnchorPoint = Vector2.new(0, 0)
Instances.paste.NextSelectionRight = nil
Instances.paste.ZIndex = 1
Instances.paste.AutomaticSize = Enum.AutomaticSize.None
Instances.paste.Size = UDim2.new(0, 63, 0, 30)
Instances.paste.Visible = true
Instances.paste.SizeConstraint = Enum.SizeConstraint.RelativeXY
Instances.paste.NextSelectionDown = nil
Instances.paste.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.paste.SelectionOrder = 0
Instances.paste.SelectionImageObject = nil
Instances.paste.LayoutOrder = 0
Instances.paste.Rotation = 0
Instances.paste.ClipsDescendants = false
Instances.paste.BackgroundTransparency = 0
Instances.paste.Position = UDim2.new(0.764705896, 0, 0.849206328, 0)
Instances.paste.BorderMode = Enum.BorderMode.Outline
Instances.paste.NextSelectionUp = nil
Instances.paste.BorderSizePixel = 0
Instances.paste.BackgroundColor3 = Color3.fromRGB(167, 167, 0)
Instances.paste.Modal = false
Instances.paste.Selected = false
Instances.paste.Style = Enum.ButtonStyle.Custom
Instances.paste.AutoButtonColor = true
Instances.paste.TextYAlignment = Enum.TextYAlignment.Center
Instances.paste.RichText = false
Instances.paste.TextDirection = Enum.TextDirection.Auto
Instances.paste.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.paste.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Instances.paste.Text = "Paste"
Instances.paste.TextXAlignment = Enum.TextXAlignment.Center
Instances.paste.TextStrokeTransparency = 1
Instances.paste.TextWrapped = false
Instances.paste.TextSize = 14
Instances.paste.TextTransparency = 0
Instances.paste.TextTruncate = Enum.TextTruncate.None
Instances.paste.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.paste.MaxVisibleGraphemes = -1
Instances.paste.TextScaled = false
Instances.paste.LineHeight = 1
Instances.paste.Parent = Instances.mainframe

Instances.exec.MouseButton1Click:Connect(function()
    _dtc_.schedule(Instances.TextBox.Text)
end)

Instances.clr.MouseButton1Click:Connect(function()
    Instances.TextBox.Text = ""
end)

Instances.cpy.MouseButton1Click:Connect(function()
    setclipboard(Instances.TextBox.Text)
end)

Instances.paste.MouseButton1Click:Connect(function()
    Instances.TextBox.Text = getclipboard()
end)

--Not made by me, check out this video: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
--Put this inside of your Frame and configure the speed if you would like.
--Enjoy! Credits go to: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s

local UIS = safe_service('UserInputService')
local frame = Instances.mainframe
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    safe_service('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragToggle then
            updateInput(input)
        end
    end
end)

_dtc_.pushautoexec();
