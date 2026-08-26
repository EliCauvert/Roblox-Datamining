local httpService = game:GetService("HttpService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode

local function dumpInstanceTree(p1, p2)
	-- upvalues: dumpInstanceTree (ref)
	p2 = p2 or ""
	
	if p1 == nil then
		print(p2 .. "[nil Instance]")
		
		return
	end
	print(p2 .. p0.Name)
	p2 ..= "  "
	
	for i, v in ipairs(p1:GetChildren()) do
		dumpInstanceTree(v, p2)
	end
end

return function(p3, p4, p5, p6, p7)
	-- upvalues: roduxModule (ref), roactModule (ref), roactRoduxModule (ref), appStyleProvider (ref), colorMode (ref), constants (ref), httpService (ref), coreGuiService (ref), dumpInstanceTree (ref)
	local text = "Test-" .. httpService:GenerateGUID(false)
	local var1 = roactModule.mount(roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		[tostring(p4)] = roactModule.createElement(roactRoduxModule.StoreProvider, {
			store = roduxModule.Store.new(p5, p6 or {}, { roduxModule.thunkMiddleware })
		}, {
			AppStyleProvider = roactModule.createElement(appStyleProvider, {
				style = {
					themeName = colorMode.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				Folder = roactModule.createElement("Folder", {}, { Root = roactModule.createElement(p4, p7 or {}) })
			})
		})
	}), coreGuiService, text)
	local var2 = ("game.CoreGui.%s.*[ClassName=Folder].*"):format(text)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), var2 (ref)
		p3(var2)
	end)
	
	if not ok then
		print("Test instance tree:\n")
		dumpInstanceTree(coreGuiService:FindFirstChild(text))
		print()
	end
	roactModule.unmount(var1)
	
	if not ok then
		error(status)
	end
end