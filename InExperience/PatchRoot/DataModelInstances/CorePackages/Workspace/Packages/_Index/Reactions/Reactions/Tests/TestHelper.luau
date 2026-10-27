local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local FoundationImagesModule = require(Parent.FoundationImages)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Reactions.Constants)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local RhodiumModule = require(Parent.Dev.Rhodium)
local FoundationProvider = FoundationModule.FoundationProvider
local TestHelper = {
	withFoundation = function(p1, OverlayGui, Preferences)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), FoundationModule (copy)
		return ReactModule.createElement(FoundationProvider, {
			theme = FoundationModule.Enums.Theme.Dark,
			overlayGui = OverlayGui,
			preferences = Preferences
		}, p1)
	end
}

function TestHelper.render(Subject, Container, Preferences)
	-- upvalues: ReactRobloxModule (copy), ReactTestingLibraryModule (copy), TestHelper (copy)
	local RenderResult = nil
	ReactRobloxModule.act(function()
		-- upvalues: RenderResult (ref), ReactTestingLibraryModule (upval), TestHelper (upval), Subject (copy), Container (copy), Preferences (copy)
		RenderResult = ReactTestingLibraryModule.render(TestHelper.withFoundation({ Subject = Subject }, Container, Preferences), if Container then { container = Container } else nil)
	end)
	
	return RenderResult
end

function TestHelper.createOverlayGui()
	local TestOverlay = Instance.new("ScreenGui")
	TestOverlay.Name = "TestOverlay"
	TestOverlay.Parent = game:GetService("CoreGui")
	
	return TestOverlay
end

function TestHelper.getExpectedReactionSprite(p1)
	-- upvalues: ConstantsModule (copy), FoundationImagesModule (copy)
	local Image = FoundationImagesModule.Images[ConstantsModule.ReactionIconMappings[p1]]
	
	return {
		Image = Image.Image,
		ImageRectOffset = Image.ImageRectOffset
	}
end

function TestHelper.getReactionSprite(ExpectedReactionSprite)
	return {
		Image = ExpectedReactionSprite.Image,
		ImageRectOffset = ExpectedReactionSprite.ImageRectOffset
	}
end

function TestHelper.runWhileMounted(Container, p1)
	-- upvalues: ReactRobloxModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = ReactRobloxModule.createRoot(ScreenGui)
	ReactRobloxModule.act(function()
		-- upvalues: Root (copy), Container (copy)
		Root:render(Container)
	end)
	local Success, Result = pcall(p1, ScreenGui)
	Root:unmount()
	ScreenGui:Destroy()
	
	if not Success then
		error(Result)
	end
end

function TestHelper.findFirstInstance(Object, List)
	local Flag = nil
	for _, descendant in Object:GetDescendants() do
		Flag = true
		
		for i, value in List do
			local Success, Result = pcall(function()
				-- upvalues: descendant (copy), i (copy)
				return descendant[i]
			end)
			
			if not Success or Result ~= value then
				Flag = false
				break
			end
		end
		if Flag then
			return descendant
		end
	end
	return nil
end

function TestHelper.countChildren(p1, Name, Callback): number
	-- upvalues: TestHelper (copy)
	local FirstInstance = TestHelper.findFirstInstance(p1, { Name = Name })
	
	if not FirstInstance then
		return 0
	end
	local Count = 0
	
	for _, child in FirstInstance:GetChildren() do
		if Callback == nil or Callback(child) then
			Count += 1
		end
	end
	return Count
end

function TestHelper.clickInstance(p2)
	-- upvalues: RhodiumModule (copy)
	RhodiumModule.Element.new(p2):click()
	task.wait()
end

return TestHelper