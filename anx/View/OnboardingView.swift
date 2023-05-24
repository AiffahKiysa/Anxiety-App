//
//  OnboardingView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 08/05/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var pageIndex: Int
    private let pages: [Page] = Page.pages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("ColorBackground").ignoresSafeArea()
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        VStack{
                            Spacer()
                            VStack(alignment: .leading, spacing: 30){
                                Text(page.title)
                                    .font(.system(size: 34, weight: .bold, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("ColorTextOnboarding"))
                                Text(page.text1)
                                    .font(.system(size: 24, weight: .semibold, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("ColorText"))
                                Text(page.text2)
                                    .font(.system(size: 20, weight: .regular, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("ColorText"))
                            }.padding(20)
                            Spacer()
                            if page == pages.last {
                                VStack{
                                    NavigationLink(destination: PreviousResultView()) {
                                        Text("Previous result")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(Color("ColorButton"))
                                            .frame(width: 360, height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .stroke(Color("ColorButton"))
                                            )
                                    }
                                    Spacer()
                                        .frame(height: 20)
                                    NavigationLink(destination: QuestionView()) {
                                        Text("Start")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(Color("ColorTextButton"))
                                            .frame(width: 360, height: 40)
                                            .background(Color("ColorButton"))
                                            .cornerRadius(15)
                                    }
                                }
                            } else {
                                VStack{
                                    Button {
                                        self.goToLast()
                                    } label: {
                                        Text("Skip")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(Color("ColorButton"))
                                            .frame(width: 360, height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .stroke(Color("ColorButton"))
                                            )
                                    }
                                    Spacer()
                                        .frame(height: 20)
                                    Button {
                                        self.goToNext()
                                    } label: {
                                        Text("Next")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(Color("ColorTextButton"))
                                            .frame(width: 360, height: 40)
                                            .background(Color("ColorButton"))
                                            .cornerRadius(15)
                                    }
                                }
                            }
                            Spacer()
                                .frame(height: 50)
                        }
                        .tag(page.tag)
                    }
                }
                .background(Color("ColorBackground")).ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .always))
                .animation(.easeInOut, value: pageIndex)// 2
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .tabViewStyle(PageTabViewStyle())
                
            
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func goToNext() {
        pageIndex += 1
    }
    
    func goToLast() {
        pageIndex = 2
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(pageIndex: 0)
    }
}
