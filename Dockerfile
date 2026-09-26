FROM node:22-alpine
WORKDIR /app
COPY package.json .npmrc ./
RUN npm install
COPY . .
ARG NEXT_PUBLIC_HUB_URL=http://localhost:8787
ENV NEXT_PUBLIC_HUB_URL=$NEXT_PUBLIC_HUB_URL
RUN npm run build
EXPOSE 3000 8787
CMD ["npm", "run", "start:web"]
