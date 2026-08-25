local secondsToTimeStrModule = require(script.Parent.SecondsToTimeStr)

return {
	createScrubber = function(scrubberTimeLabel)
		-- upvalues: secondsToTimeStrModule (ref)
		scrubberTimeLabel.ScrubberLoadProgress = Instance.new("Frame")
		scrubberTimeLabel.ScrubberLoadProgress.Name = "ScrubberLoadProgress"
		scrubberTimeLabel.ScrubberLoadProgress.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
		scrubberTimeLabel.ScrubberLoadProgress.BackgroundTransparency = 0.5
		scrubberTimeLabel.ScrubberLoadProgress.BorderSizePixel = 0
		scrubberTimeLabel.ScrubberLoadProgress.AnchorPoint = Vector2.new(0, 0)
		scrubberTimeLabel.ScrubberLoadProgress.Position = UDim2.new(0, 0, 0, 0)
		scrubberTimeLabel.ScrubberLoadProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY
		scrubberTimeLabel.ScrubberLoadProgress.Size = UDim2.new(0, 0, 1, 0)
		scrubberTimeLabel.ScrubberLoadProgress.Parent = scrubberTimeLabel.ScrubberControlBar
		scrubberTimeLabel.ScrubberPlayProgress = Instance.new("Frame")
		scrubberTimeLabel.ScrubberPlayProgress.Name = "ScrubberPlayProgress"
		scrubberTimeLabel.ScrubberPlayProgress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		scrubberTimeLabel.ScrubberPlayProgress.BorderSizePixel = 0
		scrubberTimeLabel.ScrubberPlayProgress.AnchorPoint = Vector2.new(0, 0)
		scrubberTimeLabel.ScrubberPlayProgress.Position = UDim2.new(0, 0, 0, 0)
		scrubberTimeLabel.ScrubberPlayProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY
		scrubberTimeLabel.ScrubberPlayProgress.Size = UDim2.new(0, 0, 1, 0)
		scrubberTimeLabel.ScrubberPlayProgress.Parent = scrubberTimeLabel.ScrubberLoadProgress
		scrubberTimeLabel.ScrubberButton = Instance.new("TextButton")
		scrubberTimeLabel.ScrubberButton.Name = "ScrubberButton"
		scrubberTimeLabel.ScrubberButton.Text = ""
		scrubberTimeLabel.ScrubberButton.BackgroundTransparency = 1
		scrubberTimeLabel.ScrubberButton.BorderSizePixel = 0
		scrubberTimeLabel.ScrubberButton.AnchorPoint = Vector2.new(0, 0)
		scrubberTimeLabel.ScrubberButton.Position = UDim2.new(0, 0, 0, 0)
		scrubberTimeLabel.ScrubberButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
		scrubberTimeLabel.ScrubberButton.Size = UDim2.new(1, 0, 1, 0)
		scrubberTimeLabel.ScrubberButton.Parent = scrubberTimeLabel.ScrubberControlBar
		scrubberTimeLabel.ScrubberTimeLabel = Instance.new("TextLabel")
		scrubberTimeLabel.ScrubberTimeLabel.Name = "ScrubberTimeLabel"
		scrubberTimeLabel.ScrubberTimeLabel.Font = Enum.Font.SourceSans
		scrubberTimeLabel.ScrubberTimeLabel.TextXAlignment = Enum.TextXAlignment.Center
		scrubberTimeLabel.ScrubberTimeLabel.TextYAlignment = Enum.TextYAlignment.Center
		scrubberTimeLabel.ScrubberTimeLabel.Size = UDim2.new(0.15, 0, 1.3, 0)
		scrubberTimeLabel.ScrubberTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
		scrubberTimeLabel.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1)
		scrubberTimeLabel.ScrubberTimeLabel.Position = UDim2.new(0, 0, 0, 0)
		scrubberTimeLabel.ScrubberTimeLabel.BorderSizePixel = 0
		scrubberTimeLabel.ScrubberTimeLabel.BackgroundColor3 = scrubberTimeLabel.defaultBackgroundColor3
		scrubberTimeLabel.ScrubberTimeLabel.BackgroundTransparency = scrubberTimeLabel.defaultBackgroundTransparency
		scrubberTimeLabel.ScrubberTimeLabel.Text = secondsToTimeStrModule.convertSecondsToTimeStr(0)
		scrubberTimeLabel.ScrubberTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		scrubberTimeLabel.ScrubberTimeLabel.TextScaled = true
		scrubberTimeLabel.ScrubberTimeLabel.Parent = scrubberTimeLabel.ScrubberControlBar
		scrubberTimeLabel.ScrubberTimeLabel.Visible = false
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingBottom = UDim.new(0.05, 0)
		UIPadding.Parent = scrubberTimeLabel.ScrubberTimeLabel
		local scrubberControlBar = scrubberTimeLabel.ScrubberControlBar
		
		if scrubberControlBar then
			local var2 = function(p1)
				-- upvalues: scrubberTimeLabel (ref), scrubberControlBar (ref), secondsToTimeStrModule (copy)
				local scrubberTimeLabel_1 = scrubberTimeLabel.ScrubberTimeLabel
				
				if not scrubberTimeLabel_1 then
					warn("No ScrubberTimeLabel found")
					
					return
				end
				scrubberTimeLabel_1.Position = UDim2.new(0, p1 - scrubberControlBar.AbsolutePosition.X, 0, 0)
				local x = scrubberControlBar.AbsolutePosition.X
				local var3 = (p1 - x) / (x + scrubberControlBar.AbsoluteSize.X - x)
				scrubberTimeLabel.ScrubberTimeLabel.Text = secondsToTimeStrModule.convertSecondsToTimeStr(var3 * scrubberTimeLabel.overallLengthSeconds)
				
				if var3 > 0.75 then
					scrubberTimeLabel.ScrubberTimeLabel.AnchorPoint = Vector2.new(1, 1)
					
					return
				end
				scrubberTimeLabel.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1)
			end
			
			scrubberControlBar.MouseEnter:Connect(function(p2)
				-- upvalues: scrubberTimeLabel (ref), var2 (ref)
				scrubberTimeLabel.ScrubberTimeLabel.Visible = true
				var2(p2)
			end)
			scrubberControlBar.MouseMoved:Connect(function(p3)
				-- upvalues: var2 (ref)
				var2(p3)
			end)
			scrubberControlBar.MouseLeave:Connect(function()
				-- upvalues: scrubberTimeLabel (ref)
				scrubberTimeLabel.ScrubberTimeLabel.Visible = false
			end)
			
			return
		end
		warn("No ScrubberControlBar found")
	end
}