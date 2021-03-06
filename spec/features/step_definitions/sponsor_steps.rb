module SponsorSteps
  step "I create a new sponsor :name" do |name|
    step "I am on the Sponsors section"
    click_link 'New Sponsor'
    fill_in 'Name', with: name
    fill_in 'Twitter', with: '@yourfavoritesponsor'
    fill_in 'Website', with: 'http://mega-corp-example.com'
    fill_in 'Description', with: """
      Fusce a metus eu diam varius congue nec nec sapien. Vestibulum orci tortor, sollicitudin ac euismod non, placerat ac augue. Nunc convallis accumsan justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec malesuada vehicula lectus, viverra sodales ipsum gravida nec. Integer gravida nisi ut magna mollis molestie. Nullam pharetra accumsan sagittis. Proin tristique rhoncus orci, eget vulputate nisi sollicitudin et. Quisque lacus augue, mollis non mollis et, ullamcorper in purus. Morbi et sem orci. Praesent accumsan odio in ante ullamcorper id pellentesque mauris rhoncus. Duis vitae neque dolor. Duis sed purus at eros bibendum cursus nec a nulla. Donec turpis quam, ultricies id pretium sit amet, gravida eget leo.
      Proin ut quam eros. Donec sed lobortis diam. Nulla nec odio lacus. Quisque porttitor egestas dolor in placerat. Nunc vehicula dapibus ipsum. Duis venenatis risus non nunc fermentum dapibus. Morbi lorem ante, malesuada in mollis nec, auctor nec massa. Aenean tempus dui eget felis blandit at fringilla urna ultrices. Suspendisse feugiat, ante et viverra lacinia, lectus sem lobortis dui, ultricies consectetur leo mauris at tortor. Nunc et tortor sit amet orci consequat semper. Nulla non fringilla diam.
      Nullam eros mi, mollis in sollicitudin non, tincidunt sed enim. Sed et felis metus, rhoncus ornare nibh. Ut at magna leo. Suspendisse egestas est ac dolor imperdiet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor, erat sit amet venenatis luctus, augue libero ultrices quam, ut congue nisi risus eu purus. Cras semper consectetur elementum. Nulla vel aliquet libero. Vestibulum eget felis nec purus commodo convallis. Aliquam erat volutpat.
      Maecenas eu placerat ante. Fusce ut neque justo, et aliquet enim. In hac habitasse platea dictumst. Nullam commodo neque erat, vitae facilisis erat. Cras at mauris ut tortor vestibulum fringilla vel sed metus. Donec interdum purus a justo feugiat rutrum. Sed ac neque ut neque dictum accumsan. Cras lacinia rutrum risus, id viverra metus dictum sit amet. Fusce venenatis, urna eget cursus placerat, dui nisl fringilla purus, nec tincidunt sapien justo ut nisl. Curabitur lobortis semper neque et varius. Etiam eget lectus risus, a varius orci. Nam placerat mauris at dolor imperdiet at aliquet lectus ultricies. Duis tincidunt mi at quam condimentum lobortis.
    """
    click_button 'Create Sponsor'
    page.should have_content 'Sponsor was successfully created.'
  end

  step "a sponsor :name exists" do |name|
    Sponsor.create(name: name)
  end

  step "I should see my new sponsor, :name in the index page" do |name|
    step "I am on the Sponsors section"
    page.should have_content name
  end

  step "I should see the info for the sponsor :name" do |name|
    step "I am on the Sponsors section"
    page.should have_content name
    page.should have_content '@yourfavoritesponsor'
    page.should have_content 'http://mega-corp-example.com'
    page.should have_content 'http://mega-corp-example.com'
    page.should have_content 'Fusce a metus eu diam varius congue nec nec sapien.'
  end

  step "an existing sponsor :name" do |name|
    step "I create a new sponsor '#{name}'"
    step "I go to the Sponsors section"
  end

  step "I edit sponsor :name" do |name|
    find("a[href='/admin/sponsors/#{Sponsor.where(name: name).first.id}/edit']").click
  end

  step "I change some fields for the sponsor :name" do |name|
    step "I edit sponsor \"#{name}\""
    @new_twitter_handle = "@corp#{Random.rand 10000..99999}"
    fill_in 'Twitter', with: @new_twitter_handle
  end

  step "I save those changes to the sponsor" do
    click_button 'Update Sponsor'
  end

  step "I should see my changes to the sponsor reflected in the index page" do
    step "I go to the Sponsors section"
    page.should have_content @new_twitter_handle
  end

  step "I delete some sponsor :name" do |name|
    find("a[href='/admin/sponsors/#{Sponsor.where(name: name).first.id}'].delete_link").click
    step "I go to the Sponsors section"
  end

  step "I upload a sponsor image for :name" do |name|
    attach_file 'Image', 'spec/fixtures/sponsor.png'
    step "I save those changes to the sponsor"
  end

  step "I should see the new sponsor image for :name" do |name|
    within('.sponsor') do
      page.should have_css('img')
    end
  end

  step "I should see the sponsor image for :name on the index" do |name|
    within("#sponsor_#{Sponsor.where(name: name).first.id} .sponsor_image") do
      page.should have_css('img')
    end
  end
end
