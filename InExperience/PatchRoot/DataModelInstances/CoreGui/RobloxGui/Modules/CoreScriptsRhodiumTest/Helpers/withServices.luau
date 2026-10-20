local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local ColorMode = require(CorePackages.Packages.Foundation).Enums.ColorMode

local function dumpInstanceTree(Child, p1)
	-- upvalues: dumpInstanceTree (copy)
	local P1 = p1 or ""
	
	if Child == nil then
		print(P1 .. "[nil Instance]")
		
		return
	end
	print(P1 .. Child.Name)
	local Text = P1 .. "  "
	
	for _, child in ipairs(Child:GetChildren()) do
		dumpInstanceTree(child, Text)
	end
end

return function(Callback, p2, p3, p4, p5)
	-- upvalues: RoduxModule (copy), RoactModule (copy), RoactRoduxModule (copy), AppStyleProvider (copy), ColorMode (copy), Constants (copy), HttpService (copy), CoreGui (copy), dumpInstanceTree (copy)
	local Text = "Test-" .. HttpService:GenerateGUID(false)
	local MountResult = RoactModule.mount(RoactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		[tostring(p2)] = RoactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = RoduxModule.Store.new(p3, p4 or {}, { RoduxModule.thunkMiddleware })
		}, {
			AppStyleProvider = RoactModule.createElement(AppStyleProvider, {
				style = {
					themeName = ColorMode.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, {
				Folder = RoactModule.createElement("Folder", {}, { Root = RoactModule.createElement(p2, p5 or {}) })
			})
		})
	}), CoreGui, Text)
	local ClassName: string = ("game.CoreGui.%s.*[ClassName=Folder].*"):format(Text)
	local Success, Result = pcall(function()
		-- upvalues: Callback (copy), ClassName (copy)
		Callback(ClassName)
	end)
	
	if not Success then
		print("Test instance tree:\n")
		dumpInstanceTree(CoreGui:FindFirstChild(Text))
		print()
	end
	RoactModule.unmount(MountResult)
	
	if not Success then
		error(Result)
	end
end