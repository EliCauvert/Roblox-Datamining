local LogReporterService = game:GetService("LogReporterService")
local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("VideoServerScreen").Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)

return function()
	-- upvalues: ReactModule (copy), RoactModule (copy), Players (copy), LogReporterService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	
	return RoactModule.createElement(ReactModule.Fragment, {}, {
		BugButton = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0, 52, 0, 52),
			Position = UDim2.new(1, -10, 0, 10),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Color3.fromRGB(205, 204, 0),
			BackgroundTransparency = 0.12,
			BorderColor3 = Color3.fromRGB(204, 51, 0),
			BorderSizePixel = 2,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 24,
			ZIndex = 4,
			[ReactModule.Event.Activated] = function()
				-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy)
				UseStateResult2(true)
				UseStateResult2_1("")
				UseStateResult2_3(false)
			end
		}, {
			BugIcon = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/VideoServerScreen/bug.png",
				ZIndex = 5,
				Size = UDim2.fromOffset(48, 48),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				ScaleType = Enum.ScaleType.Fit
			})
		}),
		Dialog = UseStateResult and RoactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			BorderSizePixel = 0,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0)
		}, {
			Panel = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 5,
				Size = UDim2.new(0, 360, 0, 280),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			}, {
				Title = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "Report a Bug",
					TextSize = 18,
					ZIndex = 6,
					Size = UDim2.new(1, 0, 0, 40),
					TextColor3 = Color3.new(1, 1, 1),
					Font = Enum.Font.GothamBold
				}),
				InputContainer = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ClipsDescendants = true,
					ZIndex = 6,
					Size = UDim2.new(1, -20, 0, 140),
					Position = UDim2.new(0, 10, 0, 45),
					BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				}, {
					Input = RoactModule.createElement("TextBox", {
						Size = UDim2.new(1, 0, 0, 140),
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.new(0, 4, 0, 0),
						BackgroundTransparency = 1,
						TextColor3 = Color3.new(1, 1, 1),
						PlaceholderText = "Describe the issue...",
						MultiLine = true,
						TextWrapped = true,
						ClearTextOnFocus = false,
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						ZIndex = 7,
						Text = UseStateResult1,
						[ReactModule.Event.Changed] = function(p1)
							-- upvalues: UseStateResult2_1 (copy)
							UseStateResult2_1(p1.Text)
						end
					})
				}),
				SubmitButton = RoactModule.createElement("TextButton", {
					Size = UDim2.new(0, 140, 0, 40),
					Position = UDim2.new(0, 10, 1, -50),
					BackgroundColor3 = Color3.fromRGB(0, 120, 215),
					TextColor3 = Color3.new(1, 1, 1),
					Text = if UseStateResult3 then "Sending..." elseif UseStateResult4 then "Sent!" else "Submit",
					TextSize = 16,
					ZIndex = 6,
					[ReactModule.Event.Activated] = function()
						-- upvalues: UseStateResult3 (copy), UseStateResult4 (copy), UseStateResult2_2 (copy), Players (upval), LogReporterService (upval), UseStateResult1 (copy), UseStateResult2_3 (copy), UseStateResult2 (copy)
						if not UseStateResult3 and not UseStateResult4 then
							UseStateResult2_2(true)
							task.spawn(function()
								-- upvalues: Players (upval), LogReporterService (upval), UseStateResult1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseStateResult2 (upval)
								local LocalPlayer = Players.LocalPlayer
								LogReporterService:SubmitStratusBugReport(UseStateResult1, LocalPlayer and LocalPlayer.Name or "")
								UseStateResult2_2(false)
								UseStateResult2_3(true)
								task.wait(1.5)
								UseStateResult2(false)
							end)
							
							return
						end
					end
				}),
				CancelButton = RoactModule.createElement("TextButton", {
					Size = UDim2.new(0, 140, 0, 40),
					Position = UDim2.new(1, -150, 1, -50),
					BackgroundColor3 = Color3.fromRGB(80, 80, 80),
					TextColor3 = Color3.new(1, 1, 1),
					Text = "Cancel",
					TextSize = 16,
					ZIndex = 6,
					[ReactModule.Event.Activated] = function()
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(false)
					end
				})
			})
		}) or nil
	})
end